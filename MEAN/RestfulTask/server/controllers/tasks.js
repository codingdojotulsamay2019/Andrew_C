const mongoose = require('mongoose');
const Task = mongoose.model('Task')


module.exports = {
    index: (req, res) => {
        Task.find()
        .then(tasks => res.json(tasks))
        .catch(err => res.json(err))
    },
    new: (req, res) => {
        console.log(req.body);
        Task.create(req.body)
        .then(task => res.json(task))
        .catch(err => res.json(err))
    },
    show: (req, res) => {
        const { id } = req.params;
        Task.findOne({_id: id})
        .then(task => res.json(task))
        .catch(err => res.json(err))
    },
    update: (req, res) => {
        const { id } = req.params;
        Task.updateOne({_id: id}, res.body)
        .then(task => res.json(task))
        .catch(err => res.json(err))
    },
    destroy: (req, res) => {
        const { id } = req.params;
        Task.deleteOne({_id: id})
        .then(result => res.json(result))
        .catch(err => res.json(err))
    }
}
