-- Threat: !InfrastructureShared
-- Name: 35b35c844847
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if string.find(l_0_1, "mshta", 1, true) ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
      bm.add_related_file(l_0_4)
    end
  end
  local l_0_5, l_0_6 = bm.get_process_relationships()
  for l_0_7, l_0_8 in ipairs(l_0_5) do
    if l_0_8.image_path ~= nil then
      local l_0_9 = mp.bitand(l_0_8.reason_ex, 1)
      if l_0_9 == 1 and string.find(l_0_8.image_path, "powershell", 1, true) ~= nil then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
