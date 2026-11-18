-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Trojan:Win32/Vundo.gen!V
-- Type: 8

if peattributes.packed == true then
  return mp.CLEAN
end
if peattributes.packersigmatched == true then
  return mp.CLEAN
end
if peattributes.hasexports == true then
  return mp.CLEAN
end
if peattributes.hasboundimports == true then
  return mp.CLEAN
end
if peattributes.is_delphi == true then
  return mp.CLEAN
end
if peattributes.epinfirstsect ~= true then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if pehdr.SizeOfHeaders ~= 1024 then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 2 then
  return mp.CLEAN
end
if pehdr.DllCharacteristics ~= 1024 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].RVA <= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[2].Size ~= 60 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA <= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[3].Size then
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
if pehdr.DataDirectory[13].RVA ~= 0 then
  return mp.CLEAN
end
if pehdr.DataDirectory[13].Size ~= 0 then
  return mp.CLEAN
end
return mp.INFECTED
