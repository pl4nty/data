-- Threat: !InfrastructureShared
-- Name: 103b36da83157
-- Type: 21

local l_0_0, l_0_1, l_0_2
l_0_1 = string.match(this_sigattrlog[1].utf8p1, "\\\\(%l+)")
l_0_0 = string.match(this_sigattrlog[1].utf8p2, "\\(%l+)%.exe")
if this_sigattrlog[2].matched then
  l_0_2 = string.match(this_sigattrlog[2].utf8p1, "\\(%l+)%.exe")
end
if this_sigattrlog[3].matched then
  l_0_2 = string.match(this_sigattrlog[3].utf8p1, "\\(%l+)%.exe")
end
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1 == "" then
  return mp.CLEAN
end
if l_0_1 == l_0_0 and l_0_1 == l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
