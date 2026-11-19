-- Threat: !InfrastructureShared
-- Name: 5bb3c7795516
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = {
    [".js"] = true
  }
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1, nil, 1)
end
add_parents()
return mp.INFECTED
