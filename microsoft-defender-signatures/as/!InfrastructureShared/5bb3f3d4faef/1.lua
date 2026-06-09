-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb3f3d4faef\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched then
  return mp.CLEAN
end
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
if not isnull(l_0_0.command_line) then
  (bm.add_related_string)("nextjs_node_cmdline", l_0_0.command_line, bm.RelatedStringBMReport)
end
;
(bm.request_SMS)(l_0_0.ppid, "h+")
;
(bm.add_action)("SmsAsyncScanEvent", 100)
TrackPidAndTechniqueBM("BM", "T1190", "nextjs_rsc_deser_rce_sms_trigger", 28800)
return mp.INFECTED

