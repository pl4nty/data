-- Threat: !InfrastructureShared
-- Name: 2fb3520e89f7
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = string.gsub(l_0_1, "\"", "")
  l_0_1 = string.gsub(l_0_1, "'", "")
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "awscli", 1, true) or string.find(l_0_1, "installer", 1, true) or string.find(l_0_1, "\\\\", 1, true) or string.find(l_0_1, "openvpn", 1, true) or string.find(l_0_1, "syspro", 1, true) or string.find(l_0_1, "deployment", 1, true) or string.find(l_0_1, "activation", 1, true) or string.find(l_0_1, "authorization", 1, true) or string.find(l_0_1, "organization", 1, true) or string.find(l_0_1, "localhost", 1, true) or string.find(l_0_1, "key", 1, true) or string.find(l_0_1, "screenconnect", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
