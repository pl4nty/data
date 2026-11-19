-- Threat: !InfrastructureShared
-- Name: 15b38e1e50d4
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
      bm.add_related_file(l_0_4)
    end
  end
end
local l_0_5, l_0_6 = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_6) do
  bm.request_SMS(l_0_8.ppid, "m")
  return mp.INFECTED
end
return mp.CLEAN
