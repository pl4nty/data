-- Threat: !InfrastructureShared
-- Name: 22cb30bd16dd8
-- Type: 21
-- Flags: 1

local l_0_0
local l_0_1 = 0
l_0_0 = 2
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
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[7].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[8].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[9].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[10].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[11].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[12].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[13].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[14].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[15].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[16].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[17].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[18].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[19].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[20].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[21].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[22].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[23].matched then
  l_0_1 = l_0_1 + 1
end
if this_sigattrlog[24].matched then
  l_0_1 = l_0_1 + 1
end
if l_0_0 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
