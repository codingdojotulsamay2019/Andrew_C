const tasks = require('./../controllers/tasks');

module.exports = (app) => {
    app.get('/tasks', tasks.index),
    app.post('/new', tasks.new),
    app.get('/task/:id', tasks.show),
    app.put('/update/:id', tasks.update),
    app.delete('/remove/:id', tasks.destroy)
}
