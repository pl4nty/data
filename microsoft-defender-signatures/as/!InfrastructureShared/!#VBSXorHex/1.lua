local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 524288 then
  L0_1 = mp
  L0_1 = L0_1.readprotection
  L1_1 = false
  L0_1(L1_1)
  L0_1 = mp
  L0_1 = L0_1.readfile
  L1_1 = 0
  L2_1 = mp
  L2_1 = L2_1.getfilesize
  L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1()
  L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
  L2_1 = L0_1
  L1_1 = L0_1.find
  L3_1 = "=\""
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "[%x]+"
  L5_1 = L1_1 + 2
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "[Xx][Oo][Rr][%s]+([%d]+)"
  L6_1 = L1_1 + 2
  L7_1 = #L2_1
  L6_1 = L6_1 + L7_1
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = tonumber
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = {}
  L6_1 = nil
  L7_1 = nil
  L8_1 = 0
  L9_1 = 255
  L10_1 = 1
  for L11_1 = L8_1, L9_1, L10_1 do
    L12_1 = string
    L12_1 = L12_1.format
    L13_1 = "%02X"
    L14_1 = L11_1
    L12_1 = L12_1(L13_1, L14_1)
    L6_1 = L12_1
    L12_1 = mp
    L12_1 = L12_1.bitxor
    L13_1 = L11_1
    L14_1 = L4_1
    L12_1 = L12_1(L13_1, L14_1)
    L7_1 = L12_1
    L12_1 = string
    L12_1 = L12_1.format
    L13_1 = "%c"
    L14_1 = L7_1
    L12_1 = L12_1(L13_1, L14_1)
    L5_1[L6_1] = L12_1
  end
  L8_1 = string
  L8_1 = L8_1.gsub
  L9_1 = L2_1
  L10_1 = "(%x%x)"
  L11_1 = L5_1
  L8_1 = L8_1(L9_1, L10_1, L11_1)
  L9_1 = mp
  L9_1 = L9_1.vfo_add_buffer
  L10_1 = L8_1
  L11_1 = "[Xor]"
  L12_1 = mp
  L12_1 = L12_1.ADD_VFO_TAKE_ACTION_ON_DAD
  L9_1(L10_1, L11_1, L12_1)
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
