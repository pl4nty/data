-- Threat: !InfrastructureShared
-- Name: 4ab33b86a646
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if StringEndsWith(l_0_0, ".exe") and not contains(l_0_0, {
  "installer",
  "program files"
}) then
  return mp.INFECTED
end
return mp.CLEAN
