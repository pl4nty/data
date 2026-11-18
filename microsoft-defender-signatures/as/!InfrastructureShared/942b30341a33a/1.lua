-- Threat: !InfrastructureShared
-- Name: 942b30341a33a
-- Type: 21

local function l_0_0(l_1_0, l_1_1, l_1_2)
  if l_1_0 == nil then
    return false
  end
  l_1_0 = string.lower(l_1_0)
  if l_1_1 ~= nil and string.find(l_1_0, l_1_1, 1, true) then
    return true
  end
  if l_1_2 ~= nil and string.find(l_1_0, l_1_2, 1, true) then
    return true
  end
  return false
end

local l_0_1, l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].wp1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[1].utf8p1)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp1 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_1 == nil and l_0_2 == nil then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and l_0_0(this_sigattrlog[3].utf8p2, l_0_1, l_0_2) or this_sigattrlog[4].matched and l_0_0(this_sigattrlog[4].utf8p2, l_0_1, l_0_2) or this_sigattrlog[5].matched and l_0_0(this_sigattrlog[5].utf8p2, l_0_1, l_0_2) or this_sigattrlog[6].matched and l_0_0(this_sigattrlog[6].utf8p2, l_0_1, l_0_2) or this_sigattrlog[7].matched and l_0_0(this_sigattrlog[7].utf8p2, l_0_1, l_0_2) or this_sigattrlog[8].matched and l_0_0(this_sigattrlog[8].utf8p2, l_0_1, l_0_2) or this_sigattrlog[9].matched and l_0_0(this_sigattrlog[9].utf8p2, l_0_1, l_0_2) or this_sigattrlog[10].matched and l_0_0(this_sigattrlog[10].utf8p2, l_0_1, l_0_2) or this_sigattrlog[11].matched and l_0_0(this_sigattrlog[11].utf8p2, l_0_1, l_0_2) or this_sigattrlog[12].matched and l_0_0(this_sigattrlog[12].utf8p2, l_0_1, l_0_2) or this_sigattrlog[13].matched and l_0_0(this_sigattrlog[13].utf8p2, l_0_1, l_0_2) or this_sigattrlog[14].matched and l_0_0(this_sigattrlog[14].utf8p2, l_0_1, l_0_2) or this_sigattrlog[15].matched and l_0_0(this_sigattrlog[15].utf8p2, l_0_1, l_0_2) or this_sigattrlog[16].matched and l_0_0(this_sigattrlog[16].utf8p2, l_0_1, l_0_2) or this_sigattrlog[17].matched and l_0_0(this_sigattrlog[17].utf8p2, l_0_1, l_0_2) or this_sigattrlog[18].matched and l_0_0(this_sigattrlog[18].utf8p2, l_0_1, l_0_2) or this_sigattrlog[19].matched and l_0_0(this_sigattrlog[19].utf8p2, l_0_1, l_0_2) or this_sigattrlog[20].matched and l_0_0(this_sigattrlog[20].utf8p2, l_0_1, l_0_2) or this_sigattrlog[21].matched and l_0_0(this_sigattrlog[21].utf8p2, l_0_1, l_0_2) or this_sigattrlog[22].matched and l_0_0(this_sigattrlog[22].utf8p2, l_0_1, l_0_2) or this_sigattrlog[23].matched and l_0_0(this_sigattrlog[23].utf8p2, l_0_1, l_0_2) or this_sigattrlog[24].matched and l_0_0(this_sigattrlog[24].utf8p2, l_0_1, l_0_2) or this_sigattrlog[25].matched and l_0_0(this_sigattrlog[23].utf8p2, l_0_1, l_0_2) or this_sigattrlog[26].matched and l_0_0(this_sigattrlog[26].utf8p2, l_0_1, l_0_2) or this_sigattrlog[27].matched and l_0_0(this_sigattrlog[27].utf8p2, l_0_1, l_0_2) or this_sigattrlog[28].matched and l_0_0(this_sigattrlog[28].utf8p2, l_0_1, l_0_2) or this_sigattrlog[29].matched and l_0_0(this_sigattrlog[29].utf8p2, l_0_1, l_0_2) or this_sigattrlog[30].matched and l_0_0(this_sigattrlog[30].utf8p2, l_0_1, l_0_2) or this_sigattrlog[31].matched and l_0_0(this_sigattrlog[31].utf8p2, l_0_1, l_0_2) or this_sigattrlog[32].matched and l_0_0(this_sigattrlog[32].utf8p2, l_0_1, l_0_2) or this_sigattrlog[33].matched and l_0_0(this_sigattrlog[33].utf8p2, l_0_1, l_0_2) or this_sigattrlog[34].matched and l_0_0(this_sigattrlog[34].utf8p2, l_0_1, l_0_2) or this_sigattrlog[35].matched and l_0_0(this_sigattrlog[35].utf8p2, l_0_1, l_0_2) or this_sigattrlog[36].matched and l_0_0(this_sigattrlog[36].utf8p2, l_0_1, l_0_2) or this_sigattrlog[37].matched and l_0_0(this_sigattrlog[37].utf8p2, l_0_1, l_0_2) or this_sigattrlog[38].matched and l_0_0(this_sigattrlog[38].utf8p2, l_0_1, l_0_2) or this_sigattrlog[39].matched and l_0_0(this_sigattrlog[39].utf8p2, l_0_1, l_0_2) or this_sigattrlog[40].matched and l_0_0(this_sigattrlog[40].utf8p2, l_0_1, l_0_2) or this_sigattrlog[41].matched and l_0_0(this_sigattrlog[41].utf8p2, l_0_1, l_0_2) or this_sigattrlog[42].matched and l_0_0(this_sigattrlog[42].utf8p2, l_0_1, l_0_2) or this_sigattrlog[43].matched and l_0_0(this_sigattrlog[43].utf8p2, l_0_1, l_0_2) or this_sigattrlog[44].matched and l_0_0(this_sigattrlog[44].utf8p2, l_0_1, l_0_2) or this_sigattrlog[45].matched and l_0_0(this_sigattrlog[45].utf8p2, l_0_1, l_0_2) or this_sigattrlog[46].matched and l_0_0(this_sigattrlog[46].utf8p2, l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
