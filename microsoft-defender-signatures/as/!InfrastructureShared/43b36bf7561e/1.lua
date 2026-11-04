-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b36bf7561e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.GetCurrentTimeT)()
local l_0_1 = {}
local l_0_2 = ""
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  l_0_2 = (this_sigattrlog[1]).utf8p1
else
  return mp.CLEAN
end
local l_0_3 = (bm.get_current_process_startup_info)()
local l_0_4 = "memPagesMetadata_" .. l_0_3.ppid
AppendToRollingQueue(l_0_4, "PPID", l_0_3.ppid, 250)
AppendToRollingQueue(l_0_4, "sig_matched", l_0_2, 250)
AppendToRollingQueue(l_0_4, "start_time_procdump_a", l_0_0, 250)
local l_0_5 = (MpCommon.JsonSerialize)(l_0_1)
AppendToRollingQueue(l_0_4, "sig_context_json", l_0_5, 250)
;
(bm.request_SMS)(l_0_3.ppid, "1+")
;
(bm.add_action)("SmsAsyncScanEvent", 0)
;
(bm.add_action)("SmsAsyncScanEvent", 10000)
return mp.INFECTED

