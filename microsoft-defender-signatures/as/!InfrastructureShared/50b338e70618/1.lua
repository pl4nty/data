-- Threat: !InfrastructureShared
-- Name: 50b338e70618
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm_AddRelatedFileFromCommandLine(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
