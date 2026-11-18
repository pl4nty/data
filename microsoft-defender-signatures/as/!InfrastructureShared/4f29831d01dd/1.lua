-- Threat: !InfrastructureShared
-- Name: 4f29831d01dd
-- Type: 21

local l_0_0 = mp.GetBruteMatchData()
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = tostring(headerpage)
else
  l_0_1 = tostring(footerpage)
end
if string.find(l_0_1, "%${[0-1][0-1][0-1][0-1]+}") then
  return mp.INFECTED
elseif string.find(l_0_1, "%${[_/\\=][_/\\=][_/\\=][_/\\=]+}") then
  return mp.INFECTED
elseif string.find(l_0_1, "%${%w%w%w%w%w%w%w%w+}") then
  return mp.INFECTED
elseif string.find(l_0_1, "%${[1-9][1-9]+}") then
  return mp.INFECTED
end
return mp.CLEAN
