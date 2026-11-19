-- Threat: !InfrastructureShared
-- Name: !#Lua:MSIL.SuspiciousCrypter.CLRHeader
-- Type: 10
-- MpAttributes: pea_ismsil

local l_0_0 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR].RVA
local l_0_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_COM_DESCRIPTOR].Size
if l_0_0 == 0 or l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_rva(l_0_0, 20)
if mp.readu_u32(l_0_2, 1) ~= 72 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(l_0_2, 9)
local l_0_4 = pe.mmap_rva(l_0_3, 256)
if mp.readu_u32(l_0_4, 1) ~= 1112167234 then
  return mp.CLEAN
end
local l_0_5 = mp.readu_u32(l_0_4, 13)
local l_0_6 = string.sub(l_0_4, 17, 18)
if l_0_6 == "v2" then
  mp.set_mpattribute("Lua:MSIL:FrameworkV2")
elseif l_0_6 == "v4" then
  mp.set_mpattribute("Lua:MSIL:FrameworkV4")
else
  mp.set_mpattribute("Lua:MSIL:UnknownFrameworkVersion")
end
local l_0_7 = 17 + l_0_5
local l_0_8 = l_0_7 + 4
if 256 <= l_0_7 + 2 then
  return mp.CLEAN
end
local l_0_9 = mp.readu_u16(l_0_4, l_0_7 + 2)
if l_0_9 ~= 5 then
  mp.set_mpattribute("Lua:MSIL:NonStandardStreamCount")
end
local l_0_10 = {
  ["#~"] = true,
  ["#GUID"] = true,
  ["#US"] = true,
  ["#Blob"] = true,
  ["#Strings"] = true
}
local l_0_11 = l_0_8
for l_0_12 = 0, l_0_9 - 1 do
  if 20 <= l_0_12 or 256 <= l_0_11 then
    break
  end
  l_0_11 = l_0_11 + 8
  local l_0_13 = ""
  while l_0_11 < 256 and l_0_4:byte(l_0_11) ~= 0 do
    l_0_13 = l_0_13 .. string.char(l_0_4:byte(l_0_11))
    l_0_11 = l_0_11 + 1
  end
  if l_0_10[l_0_13] == nil then
    mp.set_mpattribute("Lua:MSIL:NonStandardStreamName")
    break
  end
  l_0_11 = l_0_11 + (#l_0_13 + 4 - #l_0_13 % 4 - #l_0_13)
end
return mp.CLEAN
