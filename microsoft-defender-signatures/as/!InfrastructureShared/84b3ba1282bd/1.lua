-- Threat: !InfrastructureShared
-- Name: 84b3ba1282bd
-- Type: 21

if not (this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" and this_sigattrlog[3].matched) or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p2
local l_0_1 = this_sigattrlog[3].utf8p2
if string.lower(l_0_0) == string.lower(l_0_1) and sysio.IsFileExists(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
