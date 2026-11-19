-- Threat: !InfrastructureShared
-- Name: 6cb32a933967
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if reportGenericRansomwareRQ("genf_linux_ransom_meta") == mp.INFECTED then
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_3.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
