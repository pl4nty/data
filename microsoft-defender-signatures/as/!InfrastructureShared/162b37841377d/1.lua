-- Threat: !InfrastructureShared
-- Name: 162b37841377d
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  local l_0_4 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_4 == bm.RELATIONSHIP_CREATED then
    bm.request_SMS(l_0_3.ppid, "M")
    bm.add_action("SmsAsyncScanEvent", 1000)
    bm.trigger_sig("BMRugmigen.C", l_0_3.image_path, l_0_3.ppid)
    bm.add_related_process(l_0_3.ppid)
  end
end
return mp.INFECTED
