-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\219b3a37747f9\0x00000aef_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" then
  addRelatedProcess()
  reportRelatedBmHits()
  ;
  (bm.add_related_string)("ImagePath", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
  return mp.INFECTED
end
return mp.CLEAN

