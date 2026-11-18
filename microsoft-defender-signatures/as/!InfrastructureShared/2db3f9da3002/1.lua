-- Threat: !InfrastructureShared
-- Name: 2db3f9da3002
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
add_parents()
return mp.INFECTED
