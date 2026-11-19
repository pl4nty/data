-- Threat: \xb0!Sankei.gen1
-- Type: 8

if pehdr.DataDirectory[6].Size ~= 34 then
  return mp.CLEAN
end
if epcode[1] ~= 232 then
  return mp.CLEAN
end
if peattributes.epscn_writable == false then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[6].RVA), 34)
local l_0_1 = pehdr.AddressOfEntryPoint - mp.readu_u32(l_0_0, 1)
if l_0_1 ~= 0 then
  return mp.CLEAN
end
local l_0_2 = mp.crc32(-1, l_0_0, 5, 26)
if l_0_2 ~= 2066038322 then
  return mp.CLEAN
end
return mp.INFECTED
