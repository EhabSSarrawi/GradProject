const sgMail = require('@sendgrid/mail')

const sendgridAPIKey = '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'

sgMail.setApiKey(sendgridAPIKey)

const sendWelcomeEmail = (email, name, Verify) => {
    sgMail.send({
        to : email,
        from : 'hamdsadouq@hotmail.com',
        subject: 'Thanks for joining in!',
        text: `Hi ${name}, Please confirm your account using this ${Verify} number`

    })
}


module.exports = {
    sendWelcomeEmail
}