-- Threat: !InfrastructureShared
-- Name: 2db38c50ff73
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p2
  bm_AddRelatedFileFromCommandLine(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
