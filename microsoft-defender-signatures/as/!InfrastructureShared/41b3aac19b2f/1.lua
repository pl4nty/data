-- Threat: !InfrastructureShared
-- Name: 41b3aac19b2f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 then
  if string.find(l_0_0, "/astronomer/astro-cli/", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "githubusercontent", 1, true) or string.find(l_0_0, "pastebin", 1, true) or string.find(l_0_0, "bit.ly", 1, true) or string.find(l_0_0, "goo.gl", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
