-- Threat: !InfrastructureShared
-- Name: 2e9b3585e61cf
-- Type: 21
-- Flags: 1

local l_0_0, l_0_1
local l_0_2 = 0
local l_0_3 = 0
l_0_0 = 3
l_0_1 = 6
if this_sigattrlog[1].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[2].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[3].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[4].matched then
  l_0_2 = l_0_2 + 2
end
if this_sigattrlog[5].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[6].matched then
  l_0_2 = l_0_2 + 2
end
if this_sigattrlog[7].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[8].matched then
  l_0_2 = l_0_2 + 1
end
if this_sigattrlog[9].matched then
  l_0_2 = l_0_2 + 2
end
if this_sigattrlog[10].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[11].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[12].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[13].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[15].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[16].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[17].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[18].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[19].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[20].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[21].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[22].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[23].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[24].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[25].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[26].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[27].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[28].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[29].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[30].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[31].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[32].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[33].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[34].matched then
  l_0_3 = l_0_3 + 2
end
if this_sigattrlog[35].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[36].matched then
  l_0_3 = l_0_3 + 1
end
if this_sigattrlog[37].matched then
  l_0_3 = l_0_3 + 1
end
if l_0_0 <= l_0_2 and l_0_1 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
