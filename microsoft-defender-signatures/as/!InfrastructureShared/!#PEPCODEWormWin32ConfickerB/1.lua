-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Worm:Win32/Conficker.B
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if pesecs[1].SizeOfRawData > 36864 then
  return mp.CLEAN
end
if pehdr.NumberOfSections < 3 then
  return mp.CLEAN
end
if pehdr.NumberOfSections > 5 then
  return mp.CLEAN
end
if pehdr.SizeOfImage < 94208 then
  return mp.CLEAN
end
if pehdr.SizeOfImage > 131072 then
  return mp.CLEAN
end
return mp.INFECTED
