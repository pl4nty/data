-- Threat: !InfrastructureShared
-- Name: 25b37840d004
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  local l_0_4 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_4 == bm.RELATIONSHIP_CREATED then
    bm.trigger_sig("Behavior:Win32/SelfdelProcCreate.A", "INFECTED", l_0_3.ppid)
    return mp.INFECTED
  end
end
return mp.CLEAN
