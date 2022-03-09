const chalk = require('chalk')
const { describe, demand, demandOption } = require('yargs')
const yargs = require('yargs')
const notes = require('./notes.js')

// const greenMsg = chalk.red.inverse.bold('rre')
// console.log(greenMsg)
// console.log(process.argv[2])
yargs.version('1.1.0')
//add 
yargs.command({
    command: 'add',
    describe: 'Add a new note',
    builder: {
      title: { 
          describe: 'Note title',
          demandOption:true,
          type: 'string'
      },
      body: {
          describe: 'Note Body',
          demandOption: true,
          type: 'string'
      }
    },
    handler (argv){
      notes.addNote(argv.title, argv.body)
    }
})
//remove 
yargs.command({
    command: 'remove',
    describe: 'Remove a note!',
    builder: {
        title: { 
            describe: 'Note title',
            demandOption:true,
            type: 'string'
        },
      },
    handler (argv){
         notes.removeNotes(argv.title)    
    }
})
//list 
yargs.command({
    command: 'list',
    describe: 'list your notes!',
    handler (){
         notes.listNotes()    
    }
})
yargs.command({
    command:'read',
    describe: 'read a note!',
    handler (){
        console.log('reading the note!')
    }

})
yargs.parse()

// const validator = require('validator')
// const getNotes = require('./notes.js')
// const string = getNotes()
// console.log(string)
// console.log(validator.isURL('https/mead.io'))
// const add = require('./utils.js')
//  const sum = add(4,2)
// console.log(sum)