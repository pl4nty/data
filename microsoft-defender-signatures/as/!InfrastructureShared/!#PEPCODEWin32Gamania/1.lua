-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Win32/Gamania
-- Type: 8

if peattributes.epscn_writable ~= true then
  return mp.CLEAN
end
if peattributes.hasboundimports == true then
  return mp.CLEAN
end
if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.epinfirstsect == true then
  return mp.CLEAN
end
if peattributes.epscn_islast == true then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 2 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size >= 80 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size <= 192 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size >= 224 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[1].RVA), 32)
if mp.readu_u32(l_0_0, 1) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 5) ~= 0 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 9) ~= 0 then
  return mp.CLEAN
end
if 0 >= mp.readu_u32(l_0_0, 13) then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 17) ~= 1 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 21) ~= 6 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 25) ~= 6 then
  return mp.CLEAN
end
if 0 >= mp.readu_u32(l_0_0, 29) then
  return mp.CLEAN
end
return mp.INFECTED
