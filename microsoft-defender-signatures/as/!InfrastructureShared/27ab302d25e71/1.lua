-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\27ab302d25e71\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.command_line) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line)
if isnull(l_0_1) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "-computername localhost", 1, true) or (string.find)(l_0_1, "-computername .", 1, true) or (string.find)(l_0_1, "-computername 127.0.0.1", 1, true) or (string.find)(l_0_1, "-computername $env:computername", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "-computername", 1, true) and not (string.find)(l_0_1, "-cn ", 1, true) then
  return mp.CLEAN
end
WinRMSessionTrackProcess("BM", nil, "Client")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMSessionProcess.A")
;
(mp.set_mpattribute)("Lua:ContextDataProcess/WinRMClientProcess.A")
return mp.INFECTED

