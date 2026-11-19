-- Threat: !InfrastructureShared
-- Name: f7b3697d63b0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if is_valid_ip(l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
