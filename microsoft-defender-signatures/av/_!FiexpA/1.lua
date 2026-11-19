-- Threat: \xd0!Fiexp.A
-- Type: 13

if mp.bitxor(headerpage[1], headerpage[5]) ~= 70 then
  return mp.CLEAN
end
if mp.bitxor(headerpage[2], headerpage[6]) ~= 83 then
  return mp.CLEAN
end
if mp.bitxor(headerpage[3], headerpage[7]) ~= 84 then
  return mp.CLEAN
end
if mp.bitxor(headerpage[4], headerpage[8]) ~= 80 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 1)
local l_0_1 = mp.getfilesize()
if 12582912 < l_0_1 or l_0_1 < 4096 then
  return mp.CLEAN
end
if 12582912 < mp.bitxor(l_0_0, mp.readu_u32(headerpage, 9)) then
  return mp.CLEAN
end
local l_0_2 = headerpage[18]
local l_0_3 = 17 + mp.bitand(l_0_2 + headerpage[17 + l_0_2], 255)
local l_0_4 = mp.readu_u16(headerpage, l_0_3)
local l_0_5 = mp.bitxor(headerpage[273], l_0_4)
l_0_5 = mp.bitand(l_0_5, 255)
if 36 < l_0_5 or l_0_5 < 12 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:FiexpEncPayload.A")
if l_0_0 ~= 0 and mp.bitxor(l_0_0, mp.readu_u32(headerpage, 9)) == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
