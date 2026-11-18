-- Threat: !InfrastructureShared
-- Name: 69b3229ce48d
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_1 ~= nil then
  bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
end
return mp.INFECTED
