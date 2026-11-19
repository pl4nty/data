-- Threat: !InfrastructureShared
-- Name: 77b37adf97fe
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\windows\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_2) do
  local l_0_5 = mp.bitand(l_0_4.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_5 == bm.RELATIONSHIP_CREATED and not IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, true) then
    bm.trigger_sig("StartedViaRUNMRU.gen!ggchild", "StartedViaRUNMRU.gen!ggchild", l_0_4.ppid)
    AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, 1, 30)
  end
end
return mp.CLEAN
