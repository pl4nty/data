-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.Q.2
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.lastscn_eqsizes ~= true then
  return mp.CLEAN
end
if peattributes.epscn_valign == true then
  return mp.CLEAN
end
if peattributes.no_relocs ~= true then
  return mp.CLEAN
end
if peattributes.epatstartentrysect ~= true then
  return mp.CLEAN
end
if pehdr.SizeOfCode ~= 0 then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
return mp.INFECTED
