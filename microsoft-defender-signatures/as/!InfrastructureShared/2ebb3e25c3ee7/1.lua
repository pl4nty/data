-- Threat: !InfrastructureShared
-- Name: 2ebb3e25c3ee7
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and l_0_0.ppid) or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_2 = sigattr_tail[l_0_1]
  if l_0_2.matched and l_0_2.attribute == 16400 and l_0_2.utf8p1 then
    local l_0_3 = string.lower(l_0_2.utf8p1)
    if l_0_3.find("powershell.exe") then
      AppendToRollingQueue("PFApp_Pid_InterestingPSCommands", l_0_0.ppid, l_0_2.utf8p1 .. l_0_2.utf8p2, 1800, 100, 0)
    end
  end
end
return mp.INFECTED
