-- Threat: !InfrastructureShared
-- Name: 3229b4801337
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = string.lower(tostring(headerpage))
else
  l_0_1 = string.lower(tostring(footerpage))
end
local l_0_2 = string.match(l_0_1, "assemblypath%s+%$(%w+)")
if l_0_2 ~= nil then
  local l_0_3 = l_0_2 .. "%s*=%s*(.-%.dll['\\\"]?)"
  local l_0_4 = string.match(l_0_1, l_0_3)
  if l_0_4 then
    TrackPidAndTechnique("RTP", "T1071.003", "tactic=registers_susptransportdll;filepath:" .. l_0_4)
    AppendToRollingQueue("XchgTransportAssembly", l_0_4, nil, 3600)
    return mp.INFECTED
  end
end
return mp.CLEAN
