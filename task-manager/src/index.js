const express = require('express')
require('./db/mongoose')
const jwt = require('jsonwebtoken')
const User = require('./models/user')
 const bcrypt = require("bcrypt")
// const Task1 = require('./models/task')
const userRouter = require('./routers/users')

const app = express()
const port = process.env.PORT || 3000
app.use(express.json())
app.use(userRouter)
app.listen(port, ()=>{
console.log('Server is up on port '+ port)
}) 
const myFunction = async ()=> {
 const token = jwt.sign({_id:'abc123'},'thisismynewcourse',{expiresIn:'7 days'})
console.log(token)
const data = jwt.verify(token, 'thisismynewcourse')
console.log(data)
}
myFunction()