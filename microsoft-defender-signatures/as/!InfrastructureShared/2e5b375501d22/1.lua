-- Threat: !InfrastructureShared
-- Name: 2e5b375501d22
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" then
  addRelatedProcess()
  reportRelatedBmHits()
  bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1 ~= nil or l_0_1.ppid ~= nil then
    TerminateParentProcessForLinux(l_0_1.ppid, 2)
  end
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    bm.trigger_sig("BmTraverseTreeBlock", "Detected", l_0_5.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
