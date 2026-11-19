-- Threat: !InfrastructureShared
-- Name: 25b377b53bc9
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil and l_0_0.command_line ~= nil then
  local l_0_1 = string.lower(l_0_0.command_line)
  if string.find(l_0_1, "/create", 1, true) and string.find(l_0_1, "/ru", 1, true) and string.find(l_0_1, "authority\\system", 1, true) and string.find(l_0_1, "/tn", 1, true) and string.find(l_0_1, "/tr", 1, true) and string.find(l_0_1, "regsvr32.exe", 1, true) and string.find(l_0_1, "/sc", 1, true) and string.find(l_0_1, "/st", 1, true) and string.find(l_0_1, "/et", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
