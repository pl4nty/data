-- Threat: !InfrastructureShared
-- Name: !#Lua:VB.SuspiciousCrypter
-- Type: 10

if epcode[1] ~= 104 then
  return mp.CLEAN
end
local l_0_0 = pehdr.ImageBase
if l_0_0 ~= 4194304 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readu_u32(epcode, 2)
if l_0_0 > l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.readfile(l_0_1 - l_0_0, 52)
if mp.readu_u32(l_0_2, 1) ~= 557138518 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(l_0_2, 45)
local l_0_4 = mp.readu_u32(l_0_2, 49)
if l_0_0 > l_0_4 then
  return mp.CLEAN
end
local l_0_5 = mp.readfile(l_0_4 - l_0_0, 8)
if mp.readu_u32(l_0_5, 1) ~= 500 then
  return mp.CLEAN
end
local l_0_6 = mp.readu_u32(l_0_5, 5)
if l_0_0 > l_0_6 then
  return mp.CLEAN
end
local l_0_7 = mp.readfile(l_0_6 - l_0_0, 68)
local l_0_8 = mp.readu_u16(l_0_7, 43)
local l_0_9 = 0
local l_0_10 = mp.readu_u32(l_0_7, 49)
if l_0_0 > l_0_10 then
  return mp.CLEAN
end
local l_0_11 = 50
local l_0_12 = false
if l_0_8 <= l_0_11 then
  l_0_11 = l_0_8 - 1
end
for l_0_13 = 0, l_0_11 do
  local l_0_14 = mp.readfile(l_0_10 - l_0_0 + l_0_13 * 48, 32)
  local l_0_15 = mp.readu_u32(l_0_14, 29)
  if l_0_15 == 0 and not l_0_12 then
    mp.set_mpattribute("Lua:VB.ObjectWithNoMethods")
    l_0_12 = true
  end
  l_0_9 = l_0_9 + l_0_15
end
local l_0_16 = l_0_3 - l_0_1
if 393216 < l_0_16 then
  mp.set_mpattribute("Lua:VB.SubMainDistanceGT_0x60000")
end
mp.set_mpattribute("Lua:VB.TotalMethods:" .. tostring(l_0_9))
mp.set_mpattribute("Lua:VB.TotalObjects:" .. tostring(l_0_8))
if 25 <= l_0_9 and l_0_9 <= 35 and (l_0_8 == 2 or l_0_8 == 3) and l_0_3 == 0 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.A")
elseif 45 <= l_0_9 and l_0_9 <= 68 and (l_0_8 == 2 or l_0_8 == 3) and l_0_3 == 0 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.B")
elseif 38 <= l_0_9 and l_0_9 <= 68 and 2 <= l_0_8 and l_0_8 <= 5 and 393216 < l_0_16 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.C")
elseif l_0_9 == 0 and 5 <= l_0_8 and l_0_8 <= 8 and 393216 < l_0_16 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.D")
elseif l_0_9 == 23 and l_0_8 == 2 and l_0_3 == 0 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.E")
elseif l_0_9 == 0 and (l_0_8 == 3 or l_0_8 == 4) and 413696 < l_0_16 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.F")
elseif l_0_9 == 0 and 9 <= l_0_8 and l_0_8 <= 12 and 393216 < l_0_16 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.G")
elseif l_0_9 == 0 and 24 <= l_0_8 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.H")
elseif l_0_9 == 147 and l_0_8 == 14 then
  mp.set_mpattribute("Lua:VB.SuspiciousCrypter.I")
end
return mp.CLEAN
