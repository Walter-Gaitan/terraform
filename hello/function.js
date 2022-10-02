exports.handler = async (event) => {
  console.log("Event: ", event);
  let responseMessage = "You did it! this is the first lambda function!";

  if (event.queryStringParameters && event.queryStringParameters["Name"]) {
    responseMessage = "Hello, " + event.queryStringParameters["Name"] + "!";
  }

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ message: responseMessage }),
  };
};
