-- Threat: !InfrastructureShared
-- Name: b9b31a802468
-- Type: 21
-- Flags: 1

local l_0_0
local l_0_1 = 0
l_0_0 = 4
if this_sigattrlog[1].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[2].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[3].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[4].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[5].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[6].matched then
  l_0_1 = l_0_1 + 2
end
if this_sigattrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[8].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[9].matched then
  l_0_1 = l_0_1 + 2
end
if l_0_0 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
