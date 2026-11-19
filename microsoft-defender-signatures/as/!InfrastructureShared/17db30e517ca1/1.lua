-- Threat: !InfrastructureShared
-- Name: 17db30e517ca1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = l_0_0:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?")
if l_0_1 then
  bm.add_related_file(l_0_1)
end
return mp.INFECTED
