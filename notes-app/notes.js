const fs = require('fs')
const chalk = require('chalk')
const getNotes = ()=> {
    return 'your notes..'
}

const removeNotes = (title)=>{
    const notes = loadNotes()
    const notesToKeep = notes.filter((note)=>note.title !== title)
    if(notesToKeep.length === notes.length){
        const greenMsg = chalk.red.inverse('No note found!')
      console.log(greenMsg)
    }
    else{
        const greenMsg = chalk.green.inverse('Note removed!')
        console.log(greenMsg)

        saveNotes(notesToKeep)

    }

}
const addNotes = (title,body)=>{
 const notes = loadNotes()
 const duplicateNotes = notes.filter((note)=>note.title===title)
 if(duplicateNotes.length === 0){
    notes.push({
        title: title,
        body: body
    })
   saveNotes(notes)
   console.log('New note were added!')
 }
 else { 
     console.log('Note title taken!')

 }

 

}

const saveNotes = (notes)=>{
const dataJSON = JSON.stringify(notes)
fs.writeFileSync('notes.json', dataJSON)
}

const loadNotes = ()=>{
    try { 
        const dataBuffer = fs.readFileSync('notes.json')
        const dataJSON = dataBuffer.toString()
        return JSON.parse(dataJSON)
    }
    catch(e){
         return []
    }

    
}
const listNotes = ()=> {
    const notes = loadNotes()
console.log(chalk.inverse('Your notes'))
notes.forEach((note)=>{
    console.log(note.title)
})
}
module.exports = { 
    getNotes: getNotes,
    addNote: addNotes,
    removeNotes: removeNotes,
    listNotes: listNotes
}