'use strict'

// const AWS = require('aws-sdk')
// const dynamo = new AWS.DynamoDB.DocumentClient()

const normalizeEvent = (event) => {
    // Api Gateway
    return {
        method: event.httpMethod,
        data: JSON.parse(event.body),
        querystring: event.queryStringParameters
    }
}

exports.handler = async (event) => {

    const { method, data, querystring } = normalizeEvent(event)

    const resultado = {
        "mensagem": "Sucesso"
    }

    return {
        statusCode: 200,
        body: JSON.stringify(resultado),
        headers: {
            'Content-Type': 'application/json',
        }
    }
}