-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\263b3642d7a26\0x00000b26_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  addRelatedProcess()
  reportRelatedBmHits()
  ;
  (bm.add_related_string)("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  local l_0_1 = (bm.get_current_process_startup_info)()
  if l_0_1 ~= nil or l_0_1.ppid ~= nil then
    TerminateParentProcessForLinux(l_0_1.ppid, 2)
  end
  local l_0_2, l_0_3 = (bm.get_process_relationships)()
  for l_0_7,l_0_8 in ipairs(l_0_3) do
    (bm.trigger_sig)("BmTraverseTreeBlock", "Detected", l_0_8.ppid)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

