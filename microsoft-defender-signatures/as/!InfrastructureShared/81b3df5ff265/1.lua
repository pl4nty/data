-- Threat: !InfrastructureShared
-- Name: 81b3df5ff265
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil and string.len(l_0_0) > 7 and (string.find(l_0_0, "TgBlAHcALQBJAHQAZQBt", 1, true) or string.find(l_0_0, "LgBQAFMAVgBFAFIAcwBpAE8Abg", 1, true) or string.find(l_0_0, "AHwASQBFAFgA", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
