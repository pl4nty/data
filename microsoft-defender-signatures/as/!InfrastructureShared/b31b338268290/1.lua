-- Threat: !InfrastructureShared
-- Name: b31b338268290
-- Type: 21

local l_0_0 = false
local l_0_1 = false
local l_0_2 = false
l_0_0 = this_sigattrlog[4].matched or this_sigattrlog[10].matched or this_sigattrlog[16].matched or this_sigattrlog[22].matched or this_sigattrlog[28].matched or this_sigattrlog[34].matched or this_sigattrlog[40].matched or this_sigattrlog[46].matched or this_sigattrlog[52].matched or this_sigattrlog[58].matched
l_0_1 = this_sigattrlog[5].matched or this_sigattrlog[11].matched or this_sigattrlog[17].matched or this_sigattrlog[23].matched or this_sigattrlog[29].matched or this_sigattrlog[35].matched or this_sigattrlog[41].matched or this_sigattrlog[47].matched or this_sigattrlog[53].matched or this_sigattrlog[59].matched
l_0_2 = this_sigattrlog[6].matched or this_sigattrlog[12].matched or this_sigattrlog[18].matched or this_sigattrlog[24].matched or this_sigattrlog[30].matched or this_sigattrlog[36].matched or this_sigattrlog[42].matched or this_sigattrlog[48].matched or this_sigattrlog[54].matched or this_sigattrlog[60].matched
if l_0_0 and l_0_1 or l_0_0 and l_0_2 or l_0_1 and l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
