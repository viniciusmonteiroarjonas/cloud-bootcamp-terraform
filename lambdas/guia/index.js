'use strict'

const AWS = require('aws-sdk')
const dynamo = new AWS.DynamoDB.DocumentClient()

const normalizeEvent = (event) => {
    // Api Gateway
    return {
        method: event.httpMethod,
        data: JSON.parse(event.body),
        querystring: event.queryStringParameters
    }
}

exports.handler = async (event) => {

    if (process.env.DEBUG) {
        console.log(`Received event: ${JSON.stringify(event)}`)
    }

    const table = event.table || process.env.TABLE
    if (!table) {
        throw new Error('No table name defined.')
    }

    const { method, data, querystring } = normalizeEvent(event)
    const params = { TableName: table }

    let res;
    let err;

    try {
        switch (method) {
            case 'GET':
                res = await dynamo.scan(params).promise()
                break;
            case 'POST':
                res = await dynamo.put({ ...params, Item: data }).promise()
                break;
            default:
                err = new Error(`Unsupported method "${method}"`)
        }
    } catch (error) {
        err = new Error(error.message)
    }

    return {
        statusCode: err ? 500 : 200,
        body: err ? err.message : JSON.stringify(res),
        headers: {
            'Content-Type': 'application/json',
        }
    }
}