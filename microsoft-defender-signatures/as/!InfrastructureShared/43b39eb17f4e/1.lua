-- Threat: !InfrastructureShared
-- Name: 43b39eb17f4e
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
  local l_0_1 = string.lower(l_0_0.command_line)
  if string.find(l_0_1, "svchost.exe -k camera -s frameserver", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_1, "program files (x86)\\citrix\\ica client\\", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
