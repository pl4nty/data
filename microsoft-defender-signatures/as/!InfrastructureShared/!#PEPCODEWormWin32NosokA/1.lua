-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Worm:Win32/Nosok.A
-- Type: 8

if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA <= 0 then
  return mp.CLEAN
end
if pehdr.MajorImageVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.MinorImageVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.BaseOfCode ~= 0 then
  return mp.CLEAN
end
if pehdr.SizeOfCode ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
