-- Threat: !InfrastructureShared
-- Name: 55b35cefd55c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0.command_line)
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) then
    mp.ReportLowfi(l_0_3, 1834945633)
  end
end
return mp.INFECTED
