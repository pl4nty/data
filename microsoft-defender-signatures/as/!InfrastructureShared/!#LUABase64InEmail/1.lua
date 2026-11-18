-- Threat: !InfrastructureShared
-- Name: !#LUA:Base64InEmail
-- Type: 13
-- MpAttributes: AGGR:Base64InEmail

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 or 50000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if nil == string.match(l_0_1, "Received: from.*%(HELO.*Message%-ID%:.*Content%-Type%:  multipart/x%-zip.*Content%-Transfer%-Encoding%: base64.*Content%-Disposition%: attachment") then
  return mp.CLEAN
end
mp.set_mpattribute("//LUA:Base64InEmail")
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_0)
local l_0_3, l_0_4, l_0_5 = string.find(l_0_2, "Content%-Type%:  multipart/x%-zip.*Content%-Transfer%-Encoding%: base64.*Content%-Disposition%: attachment\r\n\r\n(.*)\r\n\r\n%-%-%-%-boundary")
mp.vfo_add_buffer(l_0_5, "[MSG_Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
