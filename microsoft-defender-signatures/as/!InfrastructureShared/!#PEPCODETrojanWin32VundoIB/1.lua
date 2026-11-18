-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.IB
-- Type: 8

if peattributes.lastscn_falign ~= true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= false then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.isexe == true then
  return mp.CLEAN
end
if peattributes.headerchecksum0 ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.MajorImageVersion ~= 4 then
  return mp.CLEAN
end
if pehdr.MinorImageVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion ~= 5 then
  return mp.CLEAN
end
if pehdr.MinorLinkerVersion ~= 12 then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 268435456 then
  return mp.CLEAN
end
if epcode[1] ~= 104 then
  return mp.CLEAN
end
return mp.INFECTED
