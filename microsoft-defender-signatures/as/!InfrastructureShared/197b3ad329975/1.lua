-- Threat: !InfrastructureShared
-- Name: 197b3ad329975
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = isTamperProtectionOn(false)
bm.add_related_string("TpState", tostring(l_0_0), bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED
