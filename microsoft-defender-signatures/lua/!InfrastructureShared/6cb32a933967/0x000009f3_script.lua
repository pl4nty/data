-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6cb32a933967\0x000009f3_luac 

-- params : ...
-- function num : 0
if reportGenericRansomwareRQ("genf_linux_ransom_meta") == mp.INFECTED then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  local l_0_0, l_0_1 = (bm.get_process_relationships)()
  for l_0_5,l_0_6 in ipairs(l_0_1) do
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_6.ppid)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

