-- Threat: !InfrastructureShared
-- Name: 51b3453d88af
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
return mp.INFECTED
