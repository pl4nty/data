-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d4b37dccfd75\0x00000acc_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 ~= nil and l_0_0 ~= "" and isTainted(l_0_0, "remote_file_chmodexec") then
  (bm.add_related_string)("ImagePath", l_0_0, bm.RelatedStringBMReport)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN

