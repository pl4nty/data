-- Threat: !InfrastructureShared
-- Name: 1f6b30ea3e0ec
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = ""
if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
if isKnownRansomExtension(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
