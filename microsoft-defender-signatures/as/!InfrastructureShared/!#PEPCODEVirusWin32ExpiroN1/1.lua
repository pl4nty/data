-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Virus:Win32/Expiro.N.1
-- Type: 8

if pehdr.NumberOfSections <= 3 then
  return mp.CLEAN
end
if peattributes.epinfirstsect == true then
  return mp.CLEAN
end
if peattributes.epscn_islast == true then
  return mp.CLEAN
end
if epcode[1] ~= 96 then
  return mp.CLEAN
end
if epcode[2] ~= 232 then
  return mp.CLEAN
end
if epcode[7] ~= 97 then
  return mp.CLEAN
end
if epcode[8] ~= 233 then
  return mp.CLEAN
end
if epcode[12] ~= 255 then
  return mp.CLEAN
end
return mp.INFECTED
