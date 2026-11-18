-- Threat: !InfrastructureShared
-- Name: 35b3e47041e0
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if string.find(l_0_0, "\\seal systems\\p2p_scripts\\", 1, true) or string.find(l_0_0, "\\blackknightfaxing\\", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
