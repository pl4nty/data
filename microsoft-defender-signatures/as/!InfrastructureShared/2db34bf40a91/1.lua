-- Threat: !InfrastructureShared
-- Name: 2db34bf40a91
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 ~= nil and string.find(l_0_0, "frombase64string", 1, true) and string.find(l_0_0, "wsqmcons", 1, true) and string.find(l_0_0, "iex", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
