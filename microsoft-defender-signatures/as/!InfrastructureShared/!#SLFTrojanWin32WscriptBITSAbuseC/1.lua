-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/WscriptBITSAbuse.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if string.match(l_0_0, "(%.[^%.]+)$") ~= ".vbs" then
  return mp.CLEAN
end
if string.match(l_0_0, "\\appdata\\roaming\\2019....\\........%.vbs") == nil then
  return mp.CLEAN
end
return mp.INFECTED
