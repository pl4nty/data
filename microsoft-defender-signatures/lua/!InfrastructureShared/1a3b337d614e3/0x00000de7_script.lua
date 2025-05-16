-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a3b337d614e3\0x00000de7_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) then
  return mp.CLEAN
end
;
(bm.request_SMS)(l_0_0.ppid, "h+")
;
(bm.add_action)("SmsAsyncScanEvent", 10000)
AppendToRollingQueue("PowershellAMSIpatch", "Amsi", "1", 86400)
return mp.CLEAN

