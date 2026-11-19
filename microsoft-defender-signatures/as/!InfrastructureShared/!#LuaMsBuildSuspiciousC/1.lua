-- Threat: !InfrastructureShared
-- Name: !#Lua:MsBuildSuspicious.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (SLF:MsBuildInlineTsk | SLF:MsBuildInlineTsk.B | SLF:MsBuildInlineTsk.C)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if l_0_0 ~= "msbuild.exe" then
  return mp.CLEAN
end
return mp.INFECTED
