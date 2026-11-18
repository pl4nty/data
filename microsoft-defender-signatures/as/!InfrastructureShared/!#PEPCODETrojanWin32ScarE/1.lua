-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Scar.E
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 106496 then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 131072 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 5 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 2019914798 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize < 20992 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualSize > 23040 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint < 5888 then
  return mp.CLEAN
end
if pehdr.AddressOfEntryPoint > 6144 then
  return mp.CLEAN
end
return mp.INFECTED
