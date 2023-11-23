const joi = require("joi");
const { promisify } = require('util');
const jwt = require("jsonwebtoken");

const validateCreateUser = async (req, res, next) => {
    try {
        const schema = joi.object({
            first_name: joi.string().trim().required().messages({
                'string.empty': `"First name" cannot be empty`,
                'any.required': `"First name" is required`,
            }),
            last_name: joi.string().trim().required().messages({
                'string.empty': `"Last name" cannot be empty`,
                'any.required': `"Last name" is required`,
            }),
            email: joi.string().trim().email({
                minDomainSegments: 2,
                tlds: { allow: ['com', 'net'] }, 
            }).required().messages({
                'string.email': `"Email" must be a valid email address`,
                'string.empty': `"Email" cannot be empty`,
                'any.required': `"Email" is required`,
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
      success: false,
    });
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
    });

    await loginSchema.validateAsync(req.body, { abortEarly: true });
    next();
  } catch (error) {
    return res.status(422).json({
      message: error.message,
      success: false,
    });
  }
};

const auth = async (req, res, next) => {
  const authHeader = req.headers.authorization;
  if (!authHeader || !authHeader.startsWith("Bearer")) {
    return next(
      res.status(401).json({
        status: "error",
        message: "Authentication invalid 01",
      })
    );
  }
  const token = authHeader.split(" ")[1];

  try {
    const payload = await promisify(jwt.verify)(token, process.env.JWT_SECRET);
    // attach the user to the job routes
    req.user = {
      userId: payload.user._id,
      firstName: payload.user.firstName,
      email: payload.user.email,
    };
    next();
  } catch (error) {
    return next(
      res.status(401).json({
        status: "error",
        message: error,
      })
    );
  }
};

module.exports = {
  validateCreateUser,
  validateLogin,
  auth,
};
