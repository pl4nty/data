-- Threat: !InfrastructureShared
-- Name: 3029075ce361
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil or l_0_0 < 200 or 2097152 < l_0_0 then
  return mp.INFECTED
end
local l_0_1 = 21
local l_0_2 = 2097152
local l_0_3 = ""
mp.readprotection(false)
if l_0_2 > l_0_0 - l_0_1 then
  l_0_3 = mp.readfile(l_0_1, l_0_0 - l_0_1)
else
  l_0_3 = mp.readfile(l_0_1, l_0_2)
end
mp.readprotection(true)
if l_0_3 == nil or #l_0_3 < 200 then
  return mp.INFECTED
end
local l_0_4 = string.find(l_0_3, "\"", -20, true) - 1
if l_0_4 == nil then
  return mp.INFECTED
end
l_0_3 = MpCommon.Base64Decode(string.sub(l_0_3, 1, l_0_4))
mp.vfo_add_buffer(l_0_3, "[DocWrite]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
