-- Threat: !InfrastructureShared
-- Name: 41b311de0011
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1 = "|.rar|.zip|.7z|"
  bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1)
end
return mp.INFECTED
