-- Threat: !InfrastructureShared
-- Name: 147b3925bbe5d
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
local l_0_1
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[4].utf8p2)
end
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if not string.find(l_0_0, " +h", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.match(l_0_0, " (%l:\\.+%.class)")
if string.find(l_0_1, l_0_2, 1, true) then
  if sysio.IsFileExists(l_0_2) then
    bm.add_threat_file(l_0_2)
  end
  return mp.INFECTED
end
return mp.CLEAN
