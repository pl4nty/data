-- Threat: !InfrastructureShared
-- Name: a13b389fe26b8
-- Type: 21

local l_0_0
local l_0_1 = 1
local l_0_2, l_0_3
l_0_0 = nil
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if this_sigattrlog[6].matched then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
l_0_2[l_0_3] = true
l_0_0 = nil
if this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p2
end
if this_sigattrlog[11].matched then
  l_0_0 = this_sigattrlog[11].utf8p2
end
if this_sigattrlog[12].matched then
  l_0_0 = this_sigattrlog[12].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p2
end
if this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17].utf8p2
end
if this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[22].matched then
  l_0_0 = this_sigattrlog[22].utf8p2
end
if this_sigattrlog[23].matched then
  l_0_0 = this_sigattrlog[23].utf8p2
end
if this_sigattrlog[24].matched then
  l_0_0 = this_sigattrlog[24].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[28].matched then
  l_0_0 = this_sigattrlog[28].utf8p2
end
if this_sigattrlog[29].matched then
  l_0_0 = this_sigattrlog[29].utf8p2
end
if this_sigattrlog[30].matched then
  l_0_0 = this_sigattrlog[30].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[34].matched then
  l_0_0 = this_sigattrlog[34].utf8p2
end
if this_sigattrlog[35].matched then
  l_0_0 = this_sigattrlog[35].utf8p2
end
if this_sigattrlog[36].matched then
  l_0_0 = this_sigattrlog[36].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[40].matched then
  l_0_0 = this_sigattrlog[40].utf8p2
end
if this_sigattrlog[41].matched then
  l_0_0 = this_sigattrlog[41].utf8p2
end
if this_sigattrlog[42].matched then
  l_0_0 = this_sigattrlog[42].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[46].matched then
  l_0_0 = this_sigattrlog[46].utf8p2
end
if this_sigattrlog[47].matched then
  l_0_0 = this_sigattrlog[47].utf8p2
end
if this_sigattrlog[48].matched then
  l_0_0 = this_sigattrlog[48].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
l_0_0 = nil
if this_sigattrlog[52].matched then
  l_0_0 = this_sigattrlog[52].utf8p2
end
if this_sigattrlog[53].matched then
  l_0_0 = this_sigattrlog[53].utf8p2
end
if this_sigattrlog[54].matched then
  l_0_0 = this_sigattrlog[54].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_3 = string.match(l_0_0, "DestIp=(.*);DestPort")
if l_0_2[l_0_3] ~= true then
  l_0_2[l_0_3] = true
  l_0_1 = l_0_1 + 1
end
if 4 <= l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
