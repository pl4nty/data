-- Threat: !InfrastructureShared
-- Name: 4a782d0da497
-- Type: 21

if not hstrlog[1].matched and not hstrlog[2].matched then
  return mp.CLEAN
end
if not peattributes.isexe then
  return mp.CLEAN
end
if pehdr.NumberOfSections ~= 3 then
  return mp.CLEAN
end
if mp.getfilesize() > 20480 then
  return mp.CLEAN
end
local l_0_0 = hstrlog[1].VA
local l_0_1 = hstrlog[2].VA
if 256 < l_0_1 - l_0_0 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u16(pe.mmap_va(l_0_1 + 21, 6), 1)
if mp.bsplit(l_0_2, 8) == 144 then
  return mp.CLEAN
end
local l_0_3 = pe.foffset_va(l_0_1)
mp.readprotection(false)
local l_0_4 = mp.readfile(0, mp.getfilesize())
if mp.bsplit(l_0_2, 8) == 117 then
  mp.writeu_u16(l_0_4, l_0_3 + 22, 37008)
elseif l_0_2 == 34063 then
  mp.writeu_u32(l_0_4, l_0_3 + 22, 2425393296)
  mp.writeu_u16(l_0_4, l_0_3 + 26, 37008)
end
mp.vfo_add_buffer(l_0_4, "[Obfuscator]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED
