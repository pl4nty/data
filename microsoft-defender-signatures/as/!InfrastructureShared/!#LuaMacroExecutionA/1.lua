-- Threat: !InfrastructureShared
-- Name: !#LuaMacroExecution.A
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & MpIsOfficeVbaAMSIScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_PROCESSNAME)
    if l_0_3 and l_0_4 ~= nil and string.find(l_0_4, "\\msaccess.exe", 1, true) == nil then
      TrackPidAndTechnique("AMSI", "T1204", "UserExecution")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
