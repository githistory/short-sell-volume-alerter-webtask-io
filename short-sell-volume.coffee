# available: context, cb

rp = require 'request-promise@4.2.1'
mailgun = require('mailgun-js@0.13.1')
  apiKey: context.secrets.MAILGUN_API_KEY
  domain: context.secrets.MAILGUN_DOMAIN
  
rp 'https://www.hkex.com.hk/eng/stat/smstat/ssturnover/ncms/ASHTMAIN.HTM'
  .then (body)->
    data =
      from: 'Short Sell Volume Alerter <short-sell-volume@webtask.io>'
      to: context.secrets.EMAIL
      subject: "Today's Short Sell Volume"
      html: body
    mailgun.messages().send data, cb
  .catch cb
