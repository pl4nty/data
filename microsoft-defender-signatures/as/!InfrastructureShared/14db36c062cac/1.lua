-- Threat: !InfrastructureShared
-- Name: 14db36c062cac
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  [".vbs"] = true
}
bm_AddRelatedFileFromCommandLine(l_0_0, l_0_1)
return mp.INFECTED
