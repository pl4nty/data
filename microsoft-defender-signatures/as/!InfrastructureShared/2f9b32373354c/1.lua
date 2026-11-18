-- Threat: !InfrastructureShared
-- Name: 2f9b32373354c
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[4].utf8p1
  l_0_0 = l_0_0:match("filepath:(.*)")
  local l_0_1 = {
    [".dll"] = true,
    [".ocx"] = true
  }
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1, nil, 6)
end
return mp.INFECTED
