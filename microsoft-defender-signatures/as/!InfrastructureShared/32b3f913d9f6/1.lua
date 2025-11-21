-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3f913d9f6\1.luac 

-- params : ...
-- function num : 0
do
  if verify_memory_features_coverage_orgs() then
    local l_0_0, l_0_1 = (bm.get_process_relationships)()
    for l_0_5,l_0_6 in ipairs(l_0_1) do
      (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

