module.exports = (req, res) => {
    if(req.method === "GET"){
        res.json({
            "NAME": "IBRAHIM"
        })
    }
}