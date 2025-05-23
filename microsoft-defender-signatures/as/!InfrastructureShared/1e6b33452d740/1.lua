-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1e6b33452d740\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid or not GetAppomalyProcessAttribute(l_0_0.ppid) then
  return mp.CLEAN
end
for l_0_4 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_5 = sigattr_tail[l_0_4]
  if l_0_5.matched and l_0_5.attribute == 16400 and l_0_5.utf8p1 then
    local l_0_6 = (string.lower)(l_0_5.utf8p1)
    local l_0_7 = "(ipconfig|curl|ping|wget|bitsadmin|certutil|schtasks|mshta|rundll32|regsvr32|msbuild|installutil|msiexec|sqltoolsps)"
    local l_0_8 = (MpCommon.StringRegExpSearch)(l_0_7, l_0_6)
    if l_0_8 then
      local l_0_9, l_0_10 = CommandLineGrader(l_0_5.utf8p2, false)
      if not l_0_10 or l_0_9 < 5 then
        return mp.CLEAN
      end
      AppendToRollingQueue("PFApp_Pid_LolBinsWin", l_0_0.ppid, l_0_5.utf8p1 .. l_0_5.utf8p2, 1800, 100, 0)
    end
  end
end
return mp.INFECTED

