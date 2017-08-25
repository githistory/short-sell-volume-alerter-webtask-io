mailgun = require('mailgun-js@0.13.1')({apiKey: context.secrets.MAILGUN_API_KEY, domain: context.secrets.MAILGUN_DOMAIN});

module.exports = (context, cb)->
  data =
    from: 'Excited User <me@samples.mailgun.org>'
    to: 'elviswilliamhk@gmail.com'
    subject: 'Hello'
    text: 'Testing some Mailgun awesomness!'
    
  mailgun.messages().send data, (error, body)->
    console.log(body)

  "done"
