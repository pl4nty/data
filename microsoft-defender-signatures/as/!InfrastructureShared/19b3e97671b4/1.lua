-- Threat: !InfrastructureShared
-- Name: 19b3e97671b4
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "-verb:sync", 1, true) and string.find(l_0_0, "-source:runcommand", 1, true) and string.find(l_0_0, "-dest:runcommand=", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
