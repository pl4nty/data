-- Threat: !InfrastructureShared
-- Name: 25b3f9452563
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
      bm.add_related_file(l_0_4)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
