-- Threat: !InfrastructureShared
-- Name: c4b321af1a1c
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 then
  l_0_1 = string.match(l_0_0, "(/.+)%s%(deleted")
  if l_0_1 then
    taint(l_0_1, "deleted_path", 120)
    return mp.INFECTED
  end
end
return mp.CLEAN
