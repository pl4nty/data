-- Threat: !InfrastructureShared
-- Name: 7bb32b7aa344
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  local l_0_4 = mp.bitand(l_0_3.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_4 == bm.RELATIONSHIP_CREATED then
    bm.trigger_sig("StartedViaRUNMRU.gen!gchild", "StartedViaRUNMRU.gen!gchild", l_0_3.ppid)
    AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, 1, 30)
  end
end
return mp.CLEAN
