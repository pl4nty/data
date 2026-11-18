-- Threat: !InfrastructureShared
-- Name: !#ShellCypt
-- Type: 13
-- MpAttributes: ALF:Backdoor:JS/PotentialWebshellDropper

local l_0_0 = mp.getfilesize()
if l_0_0 < 15000 then
  return mp.CLEAN
end
if 500000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, 768)
local l_0_2, l_0_3 = string.find(l_0_1, "{ string .*= \"")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.readfile(l_0_3, mp.getfilesize() - l_0_3)
mp.set_mpattribute("//MpBase64DecodeLongLines")
mp.vfo_add_buffer(l_0_4, "[ShellCypt]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
