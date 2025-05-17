-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\77b37adf97fe\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if (string.find)(l_0_0, "\\windows\\explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (bm.get_process_relationships)()
for l_0_6,l_0_7 in ipairs(l_0_2) do
  local l_0_8 = (mp.bitand)(l_0_7.reason_ex, bm.RELATIONSHIP_CREATED)
  if l_0_8 == bm.RELATIONSHIP_CREATED and not IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_7.ppid, true) then
    (bm.trigger_sig)("StartedViaRUNMRU.gen!ggchild", "StartedViaRUNMRU.gen!ggchild", l_0_7.ppid)
    AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_7.ppid, 1, 30)
  end
end
return mp.CLEAN

