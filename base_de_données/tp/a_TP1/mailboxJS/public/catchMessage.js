// Importation des modules nécessaires
const { MongoClient } = require('mongodb');

// URL de connexion à la base de données MongoDB
const uri = "mongodb+srv://l3info:l3infoATmongodb@cluster0.5tryz.mongodb.net";

// Création d'un nouveau client MongoDB
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

async function getMessages() {
    try {
        // Connexion au serveur MongoDB
        await client.connect();
        const database = client.db("mailbox");
        const messages = database.collection("messages");

        // Requête pour récupérer tous les messages
        const query = {};
        
        // Récupération et affichage des messages
        const cursor = messages.find(query);
        await cursor.forEach(doc => {
            console.log(`Expéditeur: ${doc.from}`);
            console.log(`Sujet: ${doc.subject}`);
            console.log(`Date: ${doc.date}`);
            console.log('---');
        });
    } finally {
        // Fermeture de la connexion
        await client.close();
    }
}

// Exécution de la fonction
getMessages().catch(console.error);
