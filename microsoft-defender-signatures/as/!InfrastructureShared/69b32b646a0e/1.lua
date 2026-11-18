-- Threat: !InfrastructureShared
-- Name: 69b32b646a0e
-- Type: 21

local l_0_0
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
local l_0_1 = string.lower(l_0_0)
if not l_0_0 or not l_0_1:match("hkcu\\software\\[^\\]+$") then
  return mp.CLEAN
end
local l_0_2, l_0_3
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p1
  l_0_3 = this_sigattrlog[4].utf8p2
end
if l_0_2 then
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, l_0_1) and 10 <= #l_0_3 then
    return mp.INFECTED
  end
end
return mp.CLEAN
