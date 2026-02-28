local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1
L0_1 = mp
L0_1 = L0_1.get_parent_filehandle
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.is_handle_nil
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.get_filesize_by_handle
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if 65536 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readprotection
L3_1 = false
L2_1(L3_1)
L2_1 = mp
L2_1 = L2_1.readfile_by_handle
L3_1 = L0_1
L4_1 = 0
L5_1 = L1_1
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = tostring
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.match
L4_1 = L2_1
L5_1 = "%z\r%z\n%zS%zT%z %z=%z %z\"%z(.-)\"%z\r%z\n"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L2_1
L6_1 = "%z\r%z\n%zN%zN%z %z=%z %z\"(.-)%z\"%z\r%z\n"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = 0
L7_1 = L4_1
L6_1 = L4_1.gmatch
L8_1 = ".."
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
for L9_1 in L6_1, L7_1, L8_1 do
  L10_1 = string
  L10_1 = L10_1.byte
  L11_1 = L9_1
  L12_1 = 1
  L13_1 = 2
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
  L12_1 = L10_1 * 256
  L12_1 = L5_1 + L12_1
  L5_1 = L12_1 + L11_1
end
L6_1 = ""
L8_1 = L3_1
L7_1 = L3_1.gmatch
L9_1 = ".."
L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
for L10_1 in L7_1, L8_1, L9_1 do
  L11_1 = string
  L11_1 = L11_1.byte
  L12_1 = L10_1
  L13_1 = 1
  L14_1 = 2
  L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1)
  L13_1 = L6_1
  L14_1 = string
  L14_1 = L14_1.format
  L15_1 = "%c"
  L16_1 = L12_1 * 256
  L16_1 = L16_1 + L11_1
  L16_1 = L16_1 - L5_1
  L17_1 = string
  L17_1 = L17_1.len
  L18_1 = L4_1
  L17_1 = L17_1(L18_1)
  L17_1 = L17_1 / 2
  L16_1 = L16_1 + L17_1
  L14_1 = L14_1(L15_1, L16_1)
  L6_1 = L13_1 .. L14_1
end
L7_1 = mp
L7_1 = L7_1.vfo_add_buffer
L8_1 = L6_1
L9_1 = "[Obfuscator.AA]"
L10_1 = mp
L10_1 = L10_1.ADD_VFO_TAKE_ACTION_ON_DAD
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
