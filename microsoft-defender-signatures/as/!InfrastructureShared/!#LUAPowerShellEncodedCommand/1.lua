-- Threat: !InfrastructureShared
-- Name: !#LUA:PowerShellEncodedCommand
-- Type: 13
-- MpAttributes: SCPT:PowerShellEncodedCommand & SCPT:PowerShellFromBase64String

local l_0_0 = mp.getfilesize()
if l_0_0 < 1280 or 65536 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "encodedcommand", 1, true)
if l_0_2 ~= nil then
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "([%w/+=]+)", l_0_3 + 1)
  if l_0_2 ~= nil then
    mp.set_mpattribute("//MpBase64DecodeLongLines")
    mp.set_mpattribute("FromEncodedCommand")
    mp.vfo_add_buffer(l_0_4, "[PSEncodedCommand]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
l_0_2, l_0_3 = string.find(l_0_1, "%:%:FromBase64String%(%'")
if l_0_2 ~= nil then
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "([%w/+=]+)", l_0_3 + 1)
  if l_0_2 ~= nil then
    mp.set_mpattribute("//MpBase64DecodeLongLines")
    mp.set_mpattribute("FromBase64String")
    mp.vfo_add_buffer(l_0_4, "[PSBase64String]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  end
end
return mp.CLEAN
