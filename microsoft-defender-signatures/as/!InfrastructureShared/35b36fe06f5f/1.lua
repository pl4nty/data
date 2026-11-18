-- Threat: !InfrastructureShared
-- Name: 35b36fe06f5f
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, "mshta", 1, true) ~= nil and string.find(l_0_1, "http", 1, true) ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
      bm.add_related_file(l_0_4)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
