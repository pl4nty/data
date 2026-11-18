-- Threat: !InfrastructureShared
-- Name: !#Lua:MSIL.SuspiciousCrypter.Tokens
-- Type: 10
-- MpAttributes: pea_ismsil & !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilesize()
if 1048576 <= l_0_0 then
  return mp.CLEAN
end
local l_0_1 = pe.get_netmetadata()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = 0
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
local l_0_6 = 0
local l_0_7 = 0
local l_0_8 = {
  1,
  2,
  3,
  5,
  7,
  9,
  11,
  13,
  18,
  22,
  24,
  25,
  28,
  33,
  36,
  41,
  42,
  43,
  44
}
for l_0_9 = 1, #l_0_8 do
  local l_0_10 = l_0_8[l_0_9]
  local l_0_11 = l_0_1.tokens[l_0_10]
  if l_0_10 == 1 then
    l_0_3 = l_0_11.count
  elseif l_0_10 == 7 then
    l_0_4 = l_0_11.count
  elseif l_0_10 == 9 then
    l_0_6 = l_0_11.count
  elseif l_0_10 == 11 then
    l_0_7 = l_0_11.count
  elseif l_0_10 == 33 then
    l_0_5 = l_0_11.count
  end
  l_0_2 = l_0_2 + l_0_11.count
end
local l_0_12 = 300
if l_0_4 <= 300 then
  l_0_12 = l_0_4
end
local l_0_13 = false
local l_0_14 = false
if l_0_3 == 1 then
  if mp.get_mpattribute("AGGR:IsDotNetAMSIScan") then
    local l_0_15 = l_0_1.strheap_RVA + pe.metadata_decode(1, 3) + 9
    local l_0_16 = pe.mmap_string_rva(l_0_15, 64)
    if l_0_16 and #l_0_16 == 12 and string.find(l_0_16, "[%l%d]+.[de][lx][le]") == 1 then
      mp.set_mpattribute("Lua:MSIL:PossiblyDynGenRuntimeClass.A")
    end
  end
else
  mp.set_mpattribute("Lua:MSIL.AbnormalModuleCount")
end
if l_0_5 == 1 then
  local l_0_17 = pe.metadata_decode(536870913, 7)
  if l_0_17 and string.format("0x%08X", l_0_17) == "0x00000000" then
    mp.set_mpattribute("Lua:MSIL.PublicKeyNull")
  end
end
for l_0_18 = 1, l_0_12 do
  local l_0_19 = l_0_1.strheap_RVA + pe.metadata_decode(100663296 + l_0_18, 4)
  local l_0_20 = pe.mmap_string_rva(l_0_19, 64)
  if l_0_20 and not l_0_13 then
    for l_0_21 = 1, #l_0_20 do
      local l_0_22 = l_0_20:byte(l_0_21)
      if 126 <= l_0_22 or l_0_22 <= 32 then
        l_0_13 = true
        break
      end
    end
  end
  if l_0_20 and #l_0_20 == 0 then
    l_0_14 = true
  end
end
if l_0_13 or l_0_14 then
  mp.set_mpattribute("Lua:MSIL.AbnormalMethod.Name")
end
if l_0_2 < 100000 then
  mp.set_mpattribute("Lua:MSIL.MetadataSum:" .. tostring(l_0_2))
  mp.set_mpattribute("Lua:MSIL.TotalMethods:" .. tostring(l_0_4))
  mp.set_mpattribute("Lua:MSIL.TotalParams:" .. tostring(l_0_6))
  mp.set_mpattribute("Lua:MSIL.TotalMemberRefs:" .. tostring(l_0_7))
end
if l_0_2 == 158 and l_0_4 == 10 and l_0_6 == 5 and l_0_7 == 46 then
  mp.set_mpattribute("Lua:MSIL.SuspiciousCrypter.A")
elseif (l_0_4 == 625 or l_0_4 == 630) and l_0_6 == 135 and (l_0_7 == 288 or l_0_7 == 280) then
  mp.set_mpattribute("Lua:MSIL.SuspiciousCrypter.B")
elseif l_0_2 == 236 and l_0_4 == 22 and l_0_6 == 15 and l_0_7 == 51 then
  mp.set_mpattribute("Lua:MSIL.SuspiciousCrypter.C")
elseif l_0_2 == 263 and l_0_4 == 22 and l_0_6 == 8 and l_0_7 == 63 then
  mp.set_mpattribute("Lua:MSIL.SuspiciousCrypter.D")
end
return mp.CLEAN
