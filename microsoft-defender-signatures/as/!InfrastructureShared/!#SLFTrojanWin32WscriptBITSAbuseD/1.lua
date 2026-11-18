-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/WscriptBITSAbuse.D
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil or string.lower(l_0_0) ~= "nsservice.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_1, "(%.[^%.]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
if l_0_3 ~= ".vbs" then
  return mp.CLEAN
end
return mp.INFECTED
