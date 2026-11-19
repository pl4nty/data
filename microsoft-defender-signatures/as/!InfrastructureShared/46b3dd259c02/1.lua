-- Threat: !InfrastructureShared
-- Name: 46b3dd259c02
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil or #l_0_0 <= 20 then
  return mp.CLEAN
end
if string.find(l_0_0, " -f ", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_0, " root ", 1, true) == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "\\windows\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
