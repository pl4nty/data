-- Threat: !InfrastructureShared
-- Name: 32b3ee08a9ed
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if l_0_0 then
    bm.add_related_string("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  end
end
add_parents()
return mp.INFECTED
