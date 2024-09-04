const { Client, GatewayIntentBits, EmbedBuilder, ActionRowBuilder, ButtonBuilder, ButtonStyle } = require('discord.js');
const axios = require('axios');

// Configura el bot de Discord
const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent,
        GatewayIntentBits.MessageContent // Agregado para manejar mensajes con botones
    ]
});

// Configuración de la API de Google Custom Search
const googleApiKey = 'AIzaSyDIrZO_rzRxvf9YvbZK1yPdsj4nrc0nqwY'; // Tu clave de API
const searchEngineId = '670a0903b1cf8403b'; // Tu ID de motor de búsqueda

async function searchGoogle(query, startIndex = 1) {
    try {
        const response = await axios.get('https://www.googleapis.com/customsearch/v1', {
            params: {
                key: googleApiKey,
                cx: searchEngineId,
                q: query,
                searchType: 'image', // Especifica que estás buscando imágenes
                start: startIndex, // Index de inicio para paginación
                num: 10 // Número de resultados por página
            }
        });

        if (response.data.items && response.data.items.length > 0) {
            return response.data.items; // Devuelve los resultados
        } else {
            return null; // No se encontraron imágenes
        }
    } catch (error) {
        console.error('Error al buscar en Google:', error.message);
        return null;
    }
}

client.once('ready', () => {
    console.log(`Logged in as ${client.user.tag}`);
});

client.on('messageCreate', async message => {
    if (message.mentions.has(client.user) && !message.author.bot) {
        const query = message.content.replace(`<@${client.user.id}>`, '').trim();

        if (query) {
            let page = 1;
            const results = await searchGoogle(query, page);

            if (results) {
                // Crea un embed con la primera imagen
                const embed = new EmbedBuilder()
                    .setTitle('Aquí está lo que encontré:')
                    .setImage(results[0].link); // Muestra la primera imagen

                // Botones para la navegación
                const row = new ActionRowBuilder()
                    .addComponents(
                        new ButtonBuilder()
                            .setCustomId('previous')
                            .setLabel('◀️ Anterior')
                            .setStyle(ButtonStyle.Secondary),
                        new ButtonBuilder()
                            .setCustomId('next')
                            .setLabel('Siguiente ▶️')
                            .setStyle(ButtonStyle.Secondary)
                    );

                // Envía el mensaje con el embed y los botones
                const sentMessage = await message.channel.send({
                    embeds: [embed],
                    components: [row]
                });

                // Guarda el estado de la página y los resultados en el mensaje
                sentMessage.page = page;
                sentMessage.results = results;
                sentMessage.query = query;
            } else {
                message.channel.send('No se encontraron imágenes.');
            }
        } else {
            message.channel.send('Por favor, proporciona un término de búsqueda.');
        }
    }
});

client.on('interactionCreate', async interaction => {
    if (!interaction.isButton()) return;

    const { customId, message } = interaction;
    let { page, results, query } = message;

    if (customId === 'next') {
        page++;
    } else if (customId === 'previous') {
        page--;
    }

    if (page < 1) page = 1;

    // Obtén los resultados de la página actual
    const newResults = await searchGoogle(query, (page - 1) * 10 + 1);

    if (newResults) {
        const embed = new EmbedBuilder()
            .setTitle('Aquí está lo que encontré:')
            .setImage(newResults[0].link); // Muestra la primera imagen de la nueva página

        // Actualiza el mensaje con la nueva página de resultados
        await message.edit({
            embeds: [embed],
            components: [
                new ActionRowBuilder()
                    .addComponents(
                        new ButtonBuilder()
                            .setCustomId('previous')
                            .setLabel('◀️ Anterior')
                            .setStyle(ButtonStyle.Secondary)
                            .setDisabled(page === 1),
                        new ButtonBuilder()
                            .setCustomId('next')
                            .setLabel('Siguiente ▶️')
                            .setStyle(ButtonStyle.Secondary)
                            .setDisabled(newResults.length < 10)
                    )
            ]
        });

        // Actualiza el estado de la página y los resultados en el mensaje
        message.page = page;
        message.results = newResults;
    } else {
        await interaction.reply('No se encontraron más imágenes.');
    }
});

client.login(process.env.DISCORD_TOKEN).catch(error => {
    console.error('Error al iniciar sesión:', error);
});
