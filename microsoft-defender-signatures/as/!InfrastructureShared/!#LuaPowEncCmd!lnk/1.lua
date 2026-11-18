-- Threat: !InfrastructureShared
-- Name: !#Lua:PowEncCmd!lnk
-- Type: 13
-- MpAttributes: //RPF:IS_Lnk & SCRIPT:PowerShell & SCRIPT:EncodedCommand

local l_0_0 = mp.getfilesize()
if l_0_0 < 64 or 65536 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "-EncodedCommand%s+([%w+/]+=?=?)")
if not l_0_2 then
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "[%-/]e.?c%a*%s+([%w+/]+=?=?)")
  if not l_0_2 then
    return mp.CLEAN
  end
  return mp.CLEAN
end
mp.vfo_add_buffer(MpCommon.Base64Decode(l_0_4), "[PowEncCmdLnk]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
