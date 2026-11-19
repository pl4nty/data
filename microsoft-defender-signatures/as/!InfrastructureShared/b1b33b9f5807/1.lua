-- Threat: !InfrastructureShared
-- Name: b1b33b9f5807
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "port%s*{?([^}]*)}?")
for l_0_2 in l_0_1:gmatch("%d+") do
  if l_0_2 == "80" or l_0_2 == "443" then
    return mp.INFECTED
  end
end
return mp.CLEAN
