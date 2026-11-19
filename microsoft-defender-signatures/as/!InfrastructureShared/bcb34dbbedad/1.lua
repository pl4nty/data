-- Threat: !InfrastructureShared
-- Name: bcb34dbbedad
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[6].utf8p2
  bm.add_related_string("ReadVM", l_0_0, bm.RelatedStringBMReport)
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
