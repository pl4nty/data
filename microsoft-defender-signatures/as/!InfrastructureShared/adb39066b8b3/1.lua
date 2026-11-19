-- Threat: !InfrastructureShared
-- Name: adb39066b8b3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
local l_0_1 = {
  [".one"] = true
}
bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1, nil, 1)
return mp.INFECTED
