-- Threat: !InfrastructureShared
-- Name: !#Lua:AdodbBase64
-- Type: 13
-- MpAttributes: AGG:AdodbBase64

local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 or 100000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2 = l_0_1:match("'\"(.-)\r\n")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_2, "[Base64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
