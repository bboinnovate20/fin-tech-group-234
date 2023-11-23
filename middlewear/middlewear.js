const joi = require("joi")

const validateCreateUser = async (req, res, next) => {
    try {
        const schema = joi.object({
            fullName: joi.string().trim().required().messages({
                'string.empty': `"fullName" cannot be empty`,
                'any.required': `"fullName" is required`,
            }),
           
            email: joi.string().trim().email({
                minDomainSegments: 2,
                tlds: { allow: ['com', 'net'] }, 
            }).required().messages({
                'string.email': `"email" must be a valid email address`,
                'string.empty': `"email" cannot be empty`,
                'any.required': `"email" is required`,
            }),
            password: joi.string().min(8).required().messages({
                'string.min': `"Password" should be at least 8 characters long`,
                'string.empty': `"Password" cannot be empty`,
                'any.required': `"Password" is required`,
            }),
            country: joi.string().trim().required().messages({
                'string.empty': `"Country" cannot be empty`,
                'any.required': `"Country" is required`,
            })
        });

        await schema.validateAsync(req.body, { abortEarly: false });
        next();
    } catch (error) {
        return res.status(422).json({

            message: error.message,
            success: false
        })
    }
};


const validateLogin = async (req, res, next) => {

    try {

        const loginSchema = joi.object({

            password: joi.string().empty().required().messages({
                "string.base": `"password" must be of type "text"`,
                "string.empty": `"password" cannot be empty`,
                "string.required": `"password" is required`,
                  
            }),
            email: joi.string().email().empty().required().messages({
                "string.base": `"email" must be of type "text"`,
                "string.empty": `"email" cannot be empty`,
                "string.required": `"email" is required`,
                      
            }),
        })

            await loginSchema.validateAsync(req.body, { abortEarly: true })
            next()
  
    }

    catch (error) {

        return res.status(422).json({

            message: error.message,
            success: false
        })
    
    }
}


module.exports = {
    
    validateCreateUser,
    validateLogin,

}