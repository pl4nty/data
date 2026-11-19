-- Threat: !InfrastructureShared
-- Name: !#Trojan:JS/Flafisi.A.1
-- Type: 13

local l_0_0 = mp.IOAVGetDownloadUrl()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename():match("\\([^\\]+)$"))
if string.find(l_0_1, "flash%s*player.*%.hta$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
