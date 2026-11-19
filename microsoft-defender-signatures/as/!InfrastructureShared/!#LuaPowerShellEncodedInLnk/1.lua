-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShellEncodedInLnk
-- Type: 13
-- MpAttributes: //AGGR:LinkFile

if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:PowerShellInLnk", true)
if (not mp.get_mpattribute("SCRIPT:PowerShell") or not mp.get_mpattribute("SCRIPT:EncodedCommand")) and (l_0_0 ~= 0 or not l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if l_0_2 < 100 or 4000 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = tostring(headerpage)
local l_0_4, l_0_5, l_0_6 = string.find(l_0_3, "-[Ee][nN]*[cC]*%a*%s+[\"']*([%w+/]+=?=?)")
if not l_0_4 then
  return mp.CLEAN
end
mp.vfo_add_buffer(MpCommon.Base64Decode(l_0_6), "[PSEncodedCommand]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
