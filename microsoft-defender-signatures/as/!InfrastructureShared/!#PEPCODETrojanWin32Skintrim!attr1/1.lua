-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Skintrim!attr1
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint <= 32768 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint >= 45056 then
  return mp.CLEAN
end
if 32768 > pehdr.SizeOfCode then
  return mp.CLEAN
end
if pehdr.SizeOfCode > 49152 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 274432 then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 323584 then
  return mp.CLEAN
end
if pehdr.SizeOfInitializedData <= 225280 then
  return mp.CLEAN
end
if pehdr.SizeOfInitializedData >= 278528 then
  return mp.CLEAN
end
if pesecs[1].Characteristics ~= 1610612768 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].Characteristics ~= 1073741888 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].SizeOfRawData > 8192 then
  return mp.CLEAN
end
if 32768 > pesecs[1].SizeOfRawData then
  return mp.CLEAN
end
if 49152 < pesecs[1].SizeOfRawData then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW ~= 1920168494 then
  return mp.CLEAN
end
if mp.readu_u16(epcode, 1) ~= 60545 then
  return mp.CLEAN
end
return mp.INFECTED
