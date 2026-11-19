-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Tibs.LB
-- Type: 8

if pesecs[pehdr.NumberOfSections].VirtualSize ~= 8192 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData ~= 8192 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Characteristics ~= 3758096448 then
  return mp.CLEAN
end
if pehdr.SizeOfImage ~= 24576 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size ~= 80 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
