-- Threat: !InfrastructureShared
-- Name: !#LUA:LNK/PowEncCmdLnk.B
-- Type: 13
-- MpAttributes: SCPT:PowerShell/EncodedCommand & BM_TEXT_FILE & SCRIPT:BAT/Start

if not mp.get_mpattribute("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 64 or 65536 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
local l_0_2 = string.match(l_0_1, "-[Ee][Nn][Cc][Oo][Dd][Ee][Dd][Cc][Oo][Mm][Mm][Aa][Nn][Dd]%s+\"([^\"]+)\"")
if l_0_2 == nil then
  return mp.CLEAN
end
mp.vfo_add_buffer(MpCommon.Base64Decode(l_0_2), "[PowEncCmdLnk]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
