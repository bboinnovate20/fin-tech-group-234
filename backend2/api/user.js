module.export= (req, res) => {
        if(req.method === GET) {
            return res.json({
                "Ibrahim": "Ibrahim"
        });
        }
}