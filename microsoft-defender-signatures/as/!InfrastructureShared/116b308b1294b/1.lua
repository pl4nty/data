-- Threat: !InfrastructureShared
-- Name: 116b308b1294b
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.002", "credentialdumping")
local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
    bm.add_related_file(l_0_4)
  end
end
return mp.INFECTED
