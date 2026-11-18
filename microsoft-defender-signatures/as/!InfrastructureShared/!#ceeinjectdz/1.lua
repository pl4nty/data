-- Threat: !InfrastructureShared
-- Name: !#ceeinject.dz
-- Type: 13

local l_0_0 = mp.getfilesize()
if mp.HEADERPAGE_SZ < 4096 or l_0_0 < 4096 or 16777216 < l_0_0 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 1) == 23117 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(headerpage, 57)
if l_0_1 == 0 then
  return mp.CLEAN
end
if mp.bitand(mp.bitxor(mp.readu_u32(headerpage, 1), l_0_1), 65535) ~= 23117 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(0, 4096)
for l_0_3 = 1, 4096, 4 do
  mp.writeu_u32(l_0_2, l_0_3, mp.bitxor(mp.readu_u32(l_0_2, l_0_3), l_0_1))
end
local l_0_4 = mp.readu_u32(l_0_2, 61) + 1
if 4096 < l_0_4 then
  return mp.CLEAN
end
if mp.readu_u32(l_0_2, l_0_4) ~= 17744 then
  return mp.CLEAN
end
local l_0_5 = mp.readu_u32(l_0_2, l_0_4 + 28)
if l_0_5 ~= 2560 then
  return mp.CLEAN
end
local l_0_6 = mp.readu_u32(l_0_2, l_0_4 + 84)
if l_0_6 ~= 1024 then
  return mp.CLEAN
end
if mp.crc32(-1, l_0_2, l_0_6 + 1, 32) ~= 3735068208 then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_2, "[CeeInject.gen!DZ]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
