-- Threat: !InfrastructureShared
-- Name: 8eb3cccb3a9a
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched then
  return mp.INFECTED
end
if l_0_0 ~= nil then
  l_0_0 = string.gsub(l_0_0, "\"", "")
  if string.find(l_0_0, "/c cd /d", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
