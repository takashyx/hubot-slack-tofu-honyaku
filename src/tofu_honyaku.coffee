# Description:
#   Slackの豆腐を翻訳します
#
# Author:
#   takashyx

tofu = 0x08
# tofu = 0x40 # for test U+0040 = '@''

module.exports = (robot) ->
  robot.hear /.*/, (msg) ->
    buf = new Buffer(msg.message.text,'UTF-8')

    if buf.includes(tofu)

      # msg.send "tofu-killed: " + buf

      outputbuf = new Buffer('','UTF-8')
      length=0

      search_start_pos=0
      pos=0

      # msg.send "Input_Buffer : " + buf.toString('hex')

      while buf.indexOf(tofu,search_start_pos) >= 0
        pos=buf.indexOf(tofu,search_start_pos)
        outputbuf = Buffer.concat([outputbuf, buf.slice(search_start_pos,pos)], outputbuf.length+pos-search_start_pos)
        # msg. send "search_start_pos:" + search_start_pos
        # msg. send "pos:" + pos
        # msg.send "Output_Buffer: " + outputbuf.toString('hex')
        # msg.send "Output_Text  : " + outputbuf.toString('UTF-8')
        search_start_pos=pos+1

      # msg.send "Output_Buffer: " + outputbuf.toString('hex')
      outputbuf = Buffer.concat([outputbuf, buf.slice(search_start_pos,buf.length)], outputbuf.length+buf.length-search_start_pos)
      output_str = outputbuf.toString('UTF-8')
      # msg.send "Output_Buffer: " + outputbuf.toString('hex')
      msg.send "豆腐翻訳: " + output_str
