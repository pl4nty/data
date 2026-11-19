-- Threat: !InfrastructureShared
-- Name: 9bb34cbfc645
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
l_0_1 = string.match(l_0_0, "msiexec%.?e?x?e?\"?'?%s+(.*)$")
if l_0_1 == nil then
  return mp.CLEAN
end
if not contains(l_0_1, {".msi", ".exe"}) then
  return mp.INFECTED
end
return mp.CLEAN
