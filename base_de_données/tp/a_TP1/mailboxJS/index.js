// Importation des modules nécessaires
const { MongoClient } = require('mongodb');

// URL de connexion à la base de données MongoDB
const uri = "mongodb+srv://l3info:l3infoATmongodb@cluster0.5tryz.mongodb.net";

// Création d'un nouveau client MongoDB
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true });

client.connect().then(() => {
  run();
});

async function run() {
  try {
    // Connexion au serveur MongoDB
    await client.connect();
    // const database = client.db("mailbox");
    // const messages = database.collection("messages");

    // const dateFilter = 20240204100000

    // // Requête pour récupérer tous les messages filtrer
    // const query = {date: {$gt: dateFilter}} ;
    
    // // Récupération et affichage des messages
    // const cursor = messages.find(query);

    addMessage("jgauthi", "TD1", "message from outer space", "elo");

    const cursor = getMessages("TD1", 20240201100000);

    await cursor.forEach(doc => {
        console.log('---');
        console.log(`From: ${doc.from}`);
        console.log(`To: ${doc.to}`);
        console.log(`Date: ${doc.date}`);
        console.log(`Subject: ${doc.subject}`);
        console.log(`Content: ${doc.content}`);
        console.log('---');
    });
  } finally {
    // Fermeture de la connexion
    await client.close();
  }
}

function getMessages(groupe, date) {
    // connexion au server
    const database = client.db("mailbox")
    const messages = database.collection("messages");
    
    // filtre des messages
    const query = {
        $and: [
            { date: { $gt : date}},
            { $or: [ { to: groupe }, { to: "promo"} ] }
        ]
    };

    const options = { sort: { date: -1 } };

       // Retourner les messages filtrer
    return messages.find(query, options);
}

function addMessage(from, to, subject, content) {
    try {
        const database = client.db("mailbox");
        const messages = database.collection("messages");

        // Création du document message
        const message = {
            from,
            to,
            subject,
            content,
            date: new Date().toISOString().replace(/-/g, "").replace(/:/g, "").replace("T", "").replace(".", "").substring(0, 14)
        };

        // Insertion du message dans la base de données
        const result = await messages.insertOne(message);
        console.log(`Nouveau message ajouté avec l'ID: ${result.insertedId}`);
    } finally {
        await client.close();
    }
}