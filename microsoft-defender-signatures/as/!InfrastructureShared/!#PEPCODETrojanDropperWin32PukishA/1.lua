-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:TrojanDropper:Win32/Pukish.A
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.lastscn_falign == false then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.epatstartlastsect ~= false then
  return mp.CLEAN
end
if peattributes.hasappendeddata ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA == 0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 2 then
  return mp.CLEAN
end
if pehdr.NumberOfSections >= 5 then
  return mp.CLEAN
end
return mp.INFECTED
