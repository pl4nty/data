-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Bublik.A
-- Type: 8

if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.epscn_writable ~= false then
  return mp.CLEAN
end
if peattributes.packed ~= false then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].RVA ~= 0 then
  return mp.CLEAN
end
if peattributes.hasexports ~= false then
  return mp.CLEAN
end
if pevars.epsec > pehdr.NumberOfSections then
  return mp.CLEAN
end
if pesecs[pevars.epsec].NameDW ~= 2019914798 then
  return mp.CLEAN
end
return mp.INFECTED
