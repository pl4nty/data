-- Threat: BrowserModifier:Win32/OneStepSearch
-- Type: 8

if epcode[1] ~= 232 then
  return mp.CLEAN
end
if epcode[6] ~= 163 then
  return mp.CLEAN
end
if epcode[11] ~= 199 then
  return mp.CLEAN
end
if epcode[12] ~= 5 then
  return mp.CLEAN
end
if epcode[21] ~= 104 then
  return mp.CLEAN
end
if epcode[22] ~= 0 then
  return mp.CLEAN
end
if epcode[23] ~= 2 then
  return mp.CLEAN
end
if epcode[24] ~= 0 then
  return mp.CLEAN
end
if epcode[25] ~= 0 then
  return mp.CLEAN
end
if epcode[134] ~= 45 then
  return mp.CLEAN
end
if epcode[143] ~= 114 then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 4 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pesecs[pehdr.NumberOfSections].VirtualAddress), 832)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 832)
if l_0_1 ~= 3485187017 then
  return mp.CLEAN
end
return mp.INFECTED
