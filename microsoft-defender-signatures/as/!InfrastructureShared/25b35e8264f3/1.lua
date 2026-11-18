-- Threat: !InfrastructureShared
-- Name: 25b35e8264f3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.command_line and l_0_0.image_path then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:find("\\program files", 1, true) then
    return mp.CLEAN
  end
  bm_AddRelatedFileFromCommandLine(l_0_0.command_line, nil, nil, 1)
  triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/MsilAmsiTamper.A")
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
