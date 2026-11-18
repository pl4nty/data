-- Threat: \x84!Hupigon.DT
-- Type: 8

if pehdr.Characteristics ~= 33166 then
  return mp.CLEAN
end
if pehdr.DataDirectory[3].RVA ~= 778240 then
  return mp.CLEAN
end
if pehdr.DataDirectory[10].RVA ~= 729088 then
  return mp.CLEAN
end
if pesecs[1].NameDW ~= 825307441 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.AddressOfEntryPoint), 512)
local l_0_1 = mp.crc32(-1, l_0_0, 1, 512)
if l_0_1 ~= 1297451655 then
  return mp.CLEAN
end
return mp.INFECTED
