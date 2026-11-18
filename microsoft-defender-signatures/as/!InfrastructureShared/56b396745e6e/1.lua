-- Threat: !InfrastructureShared
-- Name: 56b396745e6e
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  if l_0_0:find(".vb", 1, true) then
    bm_AddRelatedFileFromCommandLine(l_0_0)
    return mp.INFECTED
  end
end
return mp.CLEAN
