-- Threat: !InfrastructureShared
-- Name: 5bb3ed9a89e6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = this_sigattrlog[2].utf8p1
l_0_0 = string.sub(l_0_0, 12)
local l_0_1 = this_sigattrlog[2].utf8p2
local l_0_2 = this_sigattrlog[1].utf8p1
l_0_2 = string.sub(l_0_2, 10)
local l_0_3 = this_sigattrlog[1].utf8p2
bm.add_threat_file(l_0_0)
bm.add_threat_file(l_0_1)
bm.add_threat_file(l_0_2)
bm.add_threat_file(l_0_3)
add_parents()
return mp.INFECTED
