-- Threat: !InfrastructureShared
-- Name: 6ab3ec2c1049
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil then
  local l_0_1, l_0_2, l_0_3 = string.find(l_0_0, "use \\\\(.+)@")
  if not l_0_3 then
    return mp.CLEAN
  end
  if not isPublicIP(l_0_3) then
    return mp.CLEAN
  end
end
return mp.INFECTED
