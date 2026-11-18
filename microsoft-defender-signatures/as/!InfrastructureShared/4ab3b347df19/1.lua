-- Threat: !InfrastructureShared
-- Name: 4ab3b347df19
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
if not contains(l_0_0, {"winrar.exe"}) then
  return mp.INFECTED
end
return mp.CLEAN
