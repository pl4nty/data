-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:LNK/SusLnkDownload.B
-- Type: 13
-- MpAttributes: BM_ScriptFile & SCRIPT:Lnkobfus

if not mp.get_mpattributesubstring("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = 0
local l_0_1 = mp.GetNormalizedScript(true)
l_0_1, l_0_0 = string.gsub(l_0_1, "[%'\"]%)?%+%(?[%'\"]", "")
l_0_1 = string.gsub(l_0_1, "\"([%l%d]+)\"", "%1")
if l_0_0 < 2 then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_1, "[StrConcat]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
