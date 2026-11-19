-- Threat: !InfrastructureShared
-- Name: d4b34b3bc2e4
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  local l_0_1 = {
    [".bat"] = true
  }
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1)
end
return mp.INFECTED
