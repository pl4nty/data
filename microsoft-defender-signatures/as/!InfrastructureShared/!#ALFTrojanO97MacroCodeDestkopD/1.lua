-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:O97/MacroCodeDestkop.D
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & MHSTR:MacroInside

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "\\desktop\\", 1, true) ~= nil or string.find(l_0_1, "\\downloads\\", 1, true) ~= nil then
    local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
    if l_0_2 then
      TrackPidAndTechnique(l_0_2, "T1566.001 ", "phishingattachment")
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
