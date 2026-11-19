-- Threat: !InfrastructureShared
-- Name: !Skintrim
-- Type: 8

if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 262144 then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 389120 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size < 160 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size > 240 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].VirtualAddress ~= 4096 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData < 2048 then
  return mp.CLEAN
end
if pesecs[pevars.epsec].SizeOfRawData > 8192 then
  return mp.CLEAN
end
if pesecs[pehdr.NumberOfSections].NameDW == 1920168494 then
  return mp.CLEAN
end
if pesecs[1].NameDW == 2019914798 then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW == 2019914798 then
  return mp.CLEAN
end
return mp.INFECTED
