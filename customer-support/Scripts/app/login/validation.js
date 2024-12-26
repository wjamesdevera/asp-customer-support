const REQUIRED_VALIDATION_REGEX = /^[\w ]{2,50}$/;

const NAME_VALIDATION_REGEX = /^[a-zA-Z ]{2,50}$/;

const EMAIL_VALIDATION_REGEX =
    /^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$/;

/**
 * 
 * At least one lowercase alphabet i.e. [a-z]
 * At least one uppercase alphabet i.e. [A-Z]
 * At least one Numeric digit i.e. [0-9]
 * At least one special character i.e. [‘@’, ‘$’, ‘.’, ‘#’, ‘!’, ‘%’, ‘*’, ‘?’, ‘&’, ‘^’]
 * Also, the total length must be in the range [8-16]
 * 
 */
const PASSWORD_VALIDATION_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@.#$!%*?&^])[A-Za-z\d@.#$!%*?&]{8,16}$/;

const STREET_ADDRESS_VALIDATION_REGEX = /^[0-9]+ [\w]+/;

const POSTAL_CODE_VALIDATION_REGEX = /^[\d]{4}$/;

const PHONE_NUMBER_VALIDATION_REGEX = /(^09\d{9}$)|(^\+639\d{9}$)/;

function isValidRequiredField(fieldText) {
    return REQUIRED_VALIDATION_REGEX.test(fieldText);
}

function isValidFirstName(fieldText) {
    return NAME_VALIDATION_REGEX.test(fieldText);
}

function isValidLastName(fieldText) {
    return NAME_VALIDATION_REGEX.test(fieldText);
}

function isValidMiddleName(fieldText) {
    return NAME_VALIDATION_REGEX.test(fieldText);
}

function isValidEmail(fieldText) {
    return EMAIL_VALIDATION_REGEX.test(fieldText);
}

function isValidPassword(fieldText) {
    return PASSWORD_VALIDATION_REGEX.test(fieldText)
}

function isValidStreetAddress(fieldText) {
    return REQUIRED_VALIDATION_REGEX.test(fieldText)
}

function isValidBarangay(fieldText) {
    return REQUIRED_VALIDATION_REGEX.test(fieldText)
}

function isValidCity(fieldText) {
    return REQUIRED_VALIDATION_REGEX.test(fieldText)
}

function isValidProvince(fieldText) {
    return REQUIRED_VALIDATION_REGEX.test(fieldText)
}

function isValidPostCode(fieldText) {
    return POSTAL_CODE_VALIDATION_REGEX.test(fieldText)
}

function isValidPhoneNumber(fieldText) {
    return PHONE_NUMBER_VALIDATION_REGEX.test(fieldText)
} 
