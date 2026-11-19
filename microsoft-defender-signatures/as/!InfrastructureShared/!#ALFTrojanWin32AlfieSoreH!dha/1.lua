-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/AlfieSore.H!dha
-- Type: 10

if pehdr.NumberOfSections > 12 then
  return mp.CLEAN
end
local l_0_0 = 1
while l_0_0 < pehdr.NumberOfSections + 1 do
  if pesecs[l_0_0].Name == "COMP" and pesecs[l_0_0].SizeOfRawData > 65536 then
    return mp.INFECTED
  end
  l_0_0 = l_0_0 + 1
end
return mp.CLEAN
