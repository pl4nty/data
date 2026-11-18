-- Threat: !InfrastructureShared
-- Name: a2b3f38ef2a7
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  local l_0_4 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_INJECTION)
  if l_0_4 == bm.RELATIONSHIP_INJECTION then
    TrackPidAndTechniqueBM(l_0_3.ppid, "T1055.002", "processinjection_target_h")
    bm.request_SMS(l_0_3.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
  end
end
return mp.INFECTED
