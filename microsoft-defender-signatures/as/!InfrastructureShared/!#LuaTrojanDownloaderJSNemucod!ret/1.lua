-- Threat: !InfrastructureShared
-- Name: !#Lua:TrojanDownloader:JS/Nemucod!ret
-- Type: 13

local l_0_0 = 0
if mp.get_mpattribute("SCPT:TrojanDownloader:JS/Nemucod!ret0x0a") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:TrojanDownloader:JS/Nemucod!ret0x0d") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:TrojanDownloader:JS/Nemucod!ret0x2c") then
  l_0_0 = l_0_0 + 1
end
if 2 <= l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
