-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:Win32/Lmir.AP
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if epcode[16] ~= 255 then
  return mp.CLEAN
end
if peattributes.entrybyte55 ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if pehdr.DataDirectory[6].Size <= 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[1].RVA), 32)
if 0 >= mp.readu_u32(l_0_0, 13) then
  return mp.CLEAN
end
if 0 >= mp.readu_u32(l_0_0, 25) then
  return mp.CLEAN
end
local l_0_1 = mp.readfile(pe.foffset_rva(mp.readu_u32(l_0_0, 13)), 12)
local l_0_2 = mp.crc32(-1, l_0_1, 1, 12)
if l_0_2 ~= 1965254513 then
  return mp.CLEAN
end
return mp.INFECTED
