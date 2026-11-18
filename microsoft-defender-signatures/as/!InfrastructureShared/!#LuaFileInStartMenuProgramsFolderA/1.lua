-- Threat: !InfrastructureShared
-- Name: !#Lua:FileInStartMenuProgramsFolder.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 ~= nil and string.len(l_0_0) > 40 and string.find(l_0_0, "\\microsoft\\windows\\start menu\\programs", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
