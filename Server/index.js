// Packages
const express = require('express')
const bodyParser = require('body-parser')

var stripe = require('stripe')('sk_test_51ICrbdL2PsSwsfWNWiODEnjIsY5JCp3Vn1WFsaseOT9iWZGu76NydoMBmIFaj4JsjYPv8XVNVINfBA75Nw8BMbzM00SGWsWCtN')

const app = express()

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
	extended: true
}))


app.get('/', function(req, res) {
	res.send('Hello iOSDevSchool')
})


app.post('/charge', (req, res) => {

  var description = req.body.description
  var amount = req.body.amount
  var currency = req.body.currency
  var token = req.body.stripeToken

  console.log(req.body)

  // stripe.charges.create({
  //   source: token,
  //   amount: amount,
  //   currency: currency,
  //   description: description

  // }, function(err, charge) {
  //   if(err) {
  //     console.log(err, req.body)
  //     res.status(500).end()
  //   } else {
  //     console.log('success')
  //     res.status(200).send()
  //   }
  // })

});

app.listen(3000, () => { console.log('Local host running on port 3000') })

