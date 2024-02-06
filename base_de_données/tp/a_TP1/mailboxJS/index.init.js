// express
const express = require('express');
const bodyParser= require('body-parser');
const app = express();

app.use(express.static('public'));

app.listen(8080, function() {
  console.log('En attente de connexions sur le port 8080')
});


app.use(bodyParser.json())


// ouverture par défaut du fichier mailbox.html
app.get('/', function(req, res) {  
  res.sendFile(__dirname + '/public/mailbox.html');
});

/*** Routes existantes **/
app.post("/messages/:date", function(req, res) {
    console.log("Reçu : POST /messages/" + req.params.date + " de " + req.body.group);
    res.setHeader('Content-type', 'application/json');
    res.json( getMessages(req.params.date, req.body.group) );
});


app.put("/nouveau", function(req, res) {
    console.log("Reçu : PUT /nouveau de " + req.body.from +
                "\n - Destinataire : " + req.body.to +
                "\n - Sujet : " + req.body.subject);
    res.setHeader('Content-type', 'application/json');
    res.end({ status: addMessage(req.body.from, req.body.to, req.body.subject, req.body.content) });
});


function getMessages(date, group) {
  // TODO
  return [{from: "machin", to: "truc", subject: "test", date: 20240102123124, content:"ceci est un mail test"}];
}

function addMessage(from, to, subject, content) {
  // TODO
  return 0;
}

/** Création d'une chaine AAAAMMJJHHMMSS à partir d'un objet Date donné **/
function dateToStr(now) {
  return "" + now.getFullYear()                       // année sur 4 chiffres
            + ("0" + (now.getMonth()+1)).slice(-2)    // mois sur 2 chiffres
            + ("0" + now.getDate()).slice(-2)         // jour ...
            + ("0" + now.getHours()).slice(-2)        // heures ...
            + ("0" + now.getMinutes()).slice(-2)      // minutes ...
            + ("0" + now.getSeconds()).slice(-2);     // secondes ...

}