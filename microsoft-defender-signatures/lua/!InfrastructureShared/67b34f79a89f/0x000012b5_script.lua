-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67b34f79a89f\0x000012b5_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_1) do
  local l_0_7 = (mp.bitand)(l_0_6.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_7 == bm.RELATIONSHIP_CREATED then
    (bm.trigger_sig)("StartedViaRUNMRU.gen!gchild", "StartedViaRUNMRU.gen!gchild", l_0_6.ppid)
    AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_6.ppid, 1, 30)
  end
end
return mp.CLEAN

