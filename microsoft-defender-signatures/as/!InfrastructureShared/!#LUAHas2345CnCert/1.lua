-- Threat: !InfrastructureShared
-- Name: !#LUA:Has2345CnCert
-- Type: 8
-- MpAttributes: PUA:CERT:2345Cn

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  mp.set_mpattribute("PUA:Block:2345Cn")
  return mp.INFECTED
end
local l_0_1 = l_0_0.InternalName
local l_0_2 = l_0_0.FileDescription
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
else
  l_0_1 = ""
end
l_0_2 = l_0_2 or ""
if string.find(l_0_1, "haozip", 1, true) then
  mp.set_mpattribute("PUA:Block:HaoZip")
  return mp.INFECTED
end
if l_0_2 and l_0_1 == "" then
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "2345\229\165\189\229\142\139 v", 1, true) or string.find(l_0_2, "2345}Y\139S v", 1, true) then
    mp.set_mpattribute("PUA:Block:HaoZip")
    return mp.INFECTED
  end
end
if l_0_2 and l_0_1 == "" then
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "2345\229\138\160\233\128\159\230\181\143\232\167\136\229\153\168 v", 1, true) then
    mp.set_mpattribute("PUA:Block:2345Browser")
    return mp.INFECTED
  end
end
mp.set_mpattribute("PUA:Block:2345Cn")
return mp.INFECTED
