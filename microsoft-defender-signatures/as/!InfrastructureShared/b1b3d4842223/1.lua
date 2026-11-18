-- Threat: !InfrastructureShared
-- Name: b1b3d4842223
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
end
if l_0_0 ~= nil and string.len(l_0_0) > 10 and string.find(l_0_0, "pskill", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
