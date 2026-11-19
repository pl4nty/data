-- Threat: !InfrastructureShared
-- Name: 5bb3f3d4faef
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if not this_sigattrlog[1].matched then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
if not isnull(l_0_0.command_line) then
  bm.add_related_string("nextjs_node_cmdline", l_0_0.command_line, bm.RelatedStringBMReport)
end
bm.request_SMS(l_0_0.ppid, "h+")
bm.add_action("SmsAsyncScanEvent", 100)
TrackPidAndTechniqueBM("BM", "T1190", "nextjs_rsc_deser_rce_sms_trigger", 28800)
return mp.INFECTED
