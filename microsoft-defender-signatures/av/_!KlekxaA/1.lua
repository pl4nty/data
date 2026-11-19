-- Threat: \x88!Klekxa.A
-- Type: 8

if pevars.epsec ~= 1 or pehdr.NumberOfSections ~= 2 then
  return mp.CLEAN
end
if peattributes.isexe ~= true then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint) - 918, 768)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 768)
if l_0_1 ~= 3718490045 then
  return mp.CLEAN
end
return mp.INFECTED
