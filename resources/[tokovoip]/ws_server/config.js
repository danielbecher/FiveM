module.exports = {
  //-- [REQUIRED] IPv4 Address of your teamspeak 3 server
  TSServer: "131.196.199.80",

  //-- [REQUIRED] Port of the ws_server
    //-- Make sure you open the port you specify below
  WSServerPort: 9064,

  //-- [OPTIONAL] IPv4 Address of the ws_server
  //-- Set by autoconfig
  WSServerIP: "200.9.154.136",

  //-- [OPTIONAL] IPv4 Adress of your FiveM server
  //-- Set by autoconfig if you run ws_server as FXServer resource or standalone on the same machine
  FivemServerIP: "200.9.154.136",

  //-- [OPTIONAL] Port of your FiveM Server
  //-- Set by autoconfig if you run ws_server as FXServer resource
  FivemServerPort: 30120,

  //-- [OPTIONAL] Enable connection/disconnection logs
  enableLogs: false,
};
