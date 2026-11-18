-- Threat: !InfrastructureShared
-- Name: 1b8b3ce99155d
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

local l_0_0 = bm.get_current_process_startup_info()
if not (l_0_0 and l_0_0.ppid) or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
for l_0_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_2 = sigattr_tail[l_0_1]
  if l_0_2.matched and l_0_2.attribute == 16400 and l_0_2.utf8p2 then
    local l_0_3 = string.lower(l_0_2.utf8p1 .. l_0_2.utf8p2)
    local l_0_4 = "(aduser|adgroup|dir|net|nltest|qwinsta|quser|reg\\.exe|tasklist|whoami)"
    local l_0_5 = MpCommon.StringRegExpSearch(l_0_4, l_0_3)
    if l_0_5 then
      local l_0_6, l_0_7 = CommandLineGrader(l_0_2.utf8p2, false)
      if not l_0_7 or l_0_6 < 5 then
        return mp.CLEAN
      end
      AppendToRollingQueue("PFApp_Pid_ExploratoryCommands", l_0_0.ppid, l_0_3, 1800, 100, 0)
    end
  end
end
return mp.INFECTED
