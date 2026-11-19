-- Threat: !InfrastructureShared
-- Name: 57b3e9f45a15
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil and string.match(l_0_0, "\\appdata\\") and string.match(l_0_0, " %-%-su$") then
  return mp.INFECTED
end
return mp.CLEAN
