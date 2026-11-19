-- Threat: !InfrastructureShared
-- Name: b7b3853cd8fe
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "| sh", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "| python", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
