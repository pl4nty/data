-- Threat: !InfrastructureShared
-- Name: eeb36b3ab426
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 == nil or l_0_0 == "" or string.find(l_0_0, ";", 1, true) then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[2].utf8p2
end
local l_0_2
if l_0_1 ~= nil then
  l_0_2 = l_0_1:match("^(.*)[/\\][^/\\]+$")
  if l_0_2 ~= nil and string.find(string.lower(l_0_0), string.lower(l_0_2), 1, true) then
    return mp.INFECTED
  end
end
local l_0_3
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[3].utf8p2
end
local l_0_4
if l_0_3 ~= nil then
  l_0_4 = l_0_3:match("^(.*)[/\\][^/\\]+$")
  if l_0_4 ~= nil and string.find(string.lower(l_0_0), string.lower(l_0_4), 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
