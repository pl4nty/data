-- Threat: !InfrastructureShared
-- Name: 84b3b506dbeb
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
local l_0_2 = false
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.image_path ~= nil then
    local l_0_7 = string.lower(MpCommon.PathToWin32Path(l_0_6.image_path))
    local l_0_8 = mp.bitand(l_0_6.reason_ex, 1)
    if l_0_8 == 1 then
      l_0_2 = true
    end
    if l_0_8 == 1 and mp.IsKnownFriendlyFile(l_0_7, true, false) or l_0_8 == 1 and (string.find(l_0_7, ":\\windows\\", 1, true) or string.find(l_0_7, ":\\$windows.~bt\\", 1, true) or string.find(l_0_7, ":\\program files (x86)\\", 1, true) or string.find(l_0_7, ":\\program files\\", 1, true)) then
      return mp.CLEAN
    end
  end
end
if l_0_2 == false then
  return mp.CLEAN
end
if l_0_1 ~= nil then
  local l_0_9 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    l_0_11 = mp.ContextualExpandEnvironmentVariables(l_0_11)
    if sysio.IsFileExists(l_0_11) then
      bm.add_related_file(l_0_11)
    end
  end
end
reportSessionInformation()
add_parents()
return mp.INFECTED
