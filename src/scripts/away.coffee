# Description:
#   Allows Hubot to do mathematics.
#
# Commands:
#   hubot math me <expression> - Calculate the given expression.
#   hubot convert me <expression> to <units> - Convert expression to given units.
module.exports = (robot) ->
  robot.respond /(.*)/i, (msg) ->
    token = process.env.HIPCHAT_API_TOKEN
    msg
      .http('https://api.hipchat.com/v1/users/list?format=json&auth_token=' + token)
      .get() (err, res, body) ->
        json = eval("(#{body})")
        for u in json.users
          if u.name == robot.adapter.bot.name and u.status == "dnd"
            robot.adapter.enableSlash == true
            console.log robot.adapter
            msg.send "QUIT TALKING TO ME I'M DND"
            robot.adapter.bot.setAvailability('dnd')

