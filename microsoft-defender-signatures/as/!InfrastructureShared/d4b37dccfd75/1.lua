-- Threat: !InfrastructureShared
-- Name: d4b37dccfd75
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and l_0_0 ~= "" and isTainted(l_0_0, "remote_file_chmodexec") then
  bm.add_related_string("ImagePath", l_0_0, bm.RelatedStringBMReport)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
