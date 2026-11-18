-- Threat: !InfrastructureShared
-- Name: !#PEPCODE:BrowserModifier:Win32/Fotomoto
-- Type: 8

if peattributes.isdll ~= true then
  return mp.CLEAN
end
if peattributes.hasexports ~= true then
  return mp.CLEAN
end
if pehdr.Subsystem ~= 2 then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].RVA <= 0 then
  return mp.CLEAN
end
if 0 >= pehdr.DataDirectory[1].Size then
  return mp.CLEAN
end
if pehdr.DataDirectory[1].Size >= 256 then
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
mp.readprotection(false)
local l_0_0 = mp.readfile(pe.foffset_rva(pehdr.DataDirectory[1].RVA), 32)
if mp.readu_u32(l_0_0, 1) ~= 0 then
  return mp.CLEAN
end
if 0 >= mp.readu_u32(l_0_0, 5) then
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
if mp.readu_u32(l_0_0, 21) ~= 4 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_0, 25) ~= 4 then
  return mp.CLEAN
end
if 0 >= mp.readu_u32(l_0_0, 29) then
  return mp.CLEAN
end
local l_0_1 = mp.readfile(pe.foffset_rva(mp.readu_u32(l_0_0, 13)), 13)
local l_0_2 = mp.crc32(-1, l_0_1, 1, 13)
if l_0_2 ~= 1625655034 then
  return mp.CLEAN
end
return mp.INFECTED
