-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3c9a31202\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1195", "InitialAccess_SupplyChainCompromise_ExactMatch")
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_1 ~= nil then
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected", l_0_6.ppid)
  end
end
do
  return mp.INFECTED
end

