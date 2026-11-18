-- Threat: !InfrastructureShared
-- Name: 2a29ebe61b2d
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
local l_0_2 = string.match(l_0_1, "assemblypath%s*(['\"]?%a:.+%.dll['\"]?)")
if l_0_2 then
  TrackPidAndTechnique("RTP", "T1071.003", "tactic=registers_susptransportdll;filepath:" .. l_0_2)
  AppendToRollingQueue("XchgTransportAssembly", l_0_2, nil, 3600)
  return mp.INFECTED
end
return mp.CLEAN
