-- Threat: !InfrastructureShared
-- Name: 45b3e9c9f2fd
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = pcall(bm.get_current_process_startup_info)
if l_0_0 and l_0_1 ~= nil then
  local l_0_2 = l_0_1.command_line
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = string.lower(l_0_2)
  if (l_0_3:find("powershell", 1, true) or l_0_3.find("pwsh", 1, true)) and l_0_3:match("%s+[%-/]en?c?o?d?e?d?c?o?m?m?a?n?d?%s+") then
    TrackPidAndTechniqueBM("BM", "T1071.001", "posh_webaccess_enc")
    return mp.INFECTED
  end
end
return mp.CLEAN
