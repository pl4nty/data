-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!P.2
-- Type: 8

if peattributes.isexe ~= true then
  return mp.CLEAN
end
if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.hasstandardentry == true then
  return mp.CLEAN
end
if peattributes.is_delphi == true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if pehdr.CheckSum ~= 0 then
  return mp.CLEAN
end
if pehdr.DllCharacteristics ~= 0 then
  return mp.CLEAN
end
if pehdr.FileAlignment ~= 512 then
  return mp.CLEAN
end
if pehdr.ImageBase ~= 4194304 then
  return mp.CLEAN
end
if pehdr.MajorLinkerVersion ~= 7 then
  return mp.CLEAN
end
if pehdr.MinorLinkerVersion ~= 10 then
  return mp.CLEAN
end
if pehdr.MajorOperatingSystemVersion ~= 4 then
  return mp.CLEAN
end
if pehdr.MinorOperatingSystemVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.MajorSubsystemVersion ~= 4 then
  return mp.CLEAN
end
if pehdr.MinorSubsystemVersion ~= 0 then
  return mp.CLEAN
end
if pehdr.NumberOfSections <= 2 then
  return mp.CLEAN
end
if pehdr.SectionAlignment ~= 4096 then
  return mp.CLEAN
end
if pehdr.SizeOfCode ~= 2048 then
  return mp.CLEAN
end
if pehdr.SizeOfHeaders ~= 1024 then
  return mp.CLEAN
end
if 0 >= pehdr.SizeOfInitializedData then
  return mp.CLEAN
end
if pehdr.SizeOfInitializedData >= 65535 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 2 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size ~= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[2].RVA then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[2].Size then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size >= 336 then
  return mp.CLEAN
end
if 512 <= pehdr.DataDirectory[3].Size then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[5].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[12].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].Size ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
