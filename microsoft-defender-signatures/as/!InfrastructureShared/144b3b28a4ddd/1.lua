-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\144b3b28a4ddd\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
reportRelatedBmHits()
addRelatedProcess()
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_1) do
  (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
end
return mp.INFECTED

