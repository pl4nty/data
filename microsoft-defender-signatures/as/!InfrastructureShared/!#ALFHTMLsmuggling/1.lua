local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == nil or L0_1 < 500 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = 6291456
L2_1 = mp
L2_1 = L2_1.readfile
L3_1 = 0
L4_1 = math_min
L5_1 = L0_1
L6_1 = L1_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1 = L4_1(L5_1, L6_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 0
L4_1 = string
L4_1 = L4_1.gmatch
L5_1 = L2_1
L6_1 = "<script.-</script"
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
for L7_1 in L4_1, L5_1, L6_1 do
  L8_1 = #L7_1
  if 500 < L8_1 then
    L8_1 = string
    L8_1 = L8_1.gmatch
    L9_1 = L7_1
    L10_1 = "=%s*['\"]([a-z0-9A-Z+/]+=?=?)['\"]"
    L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
    for L11_1 in L8_1, L9_1, L10_1 do
      L12_1 = #L11_1
      if 500 < L12_1 then
        L12_1 = mp
        L12_1 = L12_1.vfo_add_buffer
        L13_1 = MpCommon
        L13_1 = L13_1.Base64Decode
        L14_1 = L11_1
        L13_1 = L13_1(L14_1)
        L14_1 = "[HTMLsmuggling]"
        L15_1 = mp
        L15_1 = L15_1.ADD_VFO_TAKE_ACTION_ON_DAD
        L12_1(L13_1, L14_1, L15_1)
        L3_1 = L3_1 + 1
      end
    end
  end
end
if 0 < L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
