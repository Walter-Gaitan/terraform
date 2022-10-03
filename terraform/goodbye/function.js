exports.handler = async (event) => {
  console.log("Event: ", event);
  let responseMessage = "You did it! this is the second lambda function!";

  if (event.queryStringParameters && event.queryStringParameters["Name"]) {
    responseMessage = "Goodbye, " + event.queryStringParameters["Name"] + "!";
  }

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ message: responseMessage }),
  };
};
