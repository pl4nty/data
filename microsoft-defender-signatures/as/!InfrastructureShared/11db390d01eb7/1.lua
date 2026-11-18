-- Threat: !InfrastructureShared
-- Name: 11db390d01eb7
-- Type: 21

if not this_sigattrlog[4].matched then
  return mp.CLEAN
end
if this_sigattrlog[4].utf8p1 == nil then
  return mp.CLEAN
end
if this_sigattrlog[4].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "fsize:(%d+)")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = tonumber(l_0_3)
if l_0_4 == nil then
  return mp.CLEAN
end
if 65536 <= l_0_4 then
  return mp.CLEAN
end
bm.add_related_file(this_sigattrlog[4].utf8p1)
return mp.INFECTED
