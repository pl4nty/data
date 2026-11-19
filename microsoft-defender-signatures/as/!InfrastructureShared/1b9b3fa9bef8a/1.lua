-- Threat: !InfrastructureShared
-- Name: 1b9b3fa9bef8a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 ~= nil then
  if string.find(l_0_0, "-hashes ", 1, true) then
    return mp.INFECTED
  elseif string.find(l_0_0, "-target-ip ", 1, true) then
    return mp.INFECTED
  elseif string.match(l_0_0, "@%d+%.%d+%.%d+%.%d+") then
    return mp.INFECTED
  end
end
return mp.CLEAN
