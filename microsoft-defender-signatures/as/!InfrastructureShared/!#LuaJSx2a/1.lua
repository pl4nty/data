local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "\\x(%x%x)"

function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = string
  L1_2 = L1_2.char
  L2_2 = tonumber
  L3_2 = A0_2
  L4_2 = 16
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  return L1_2(L2_2, L3_2, L4_2)
end

L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.vfo_add_buffer
L3_1 = L1_1
L4_1 = "[JSx2a]"
L5_1 = mp
L5_1 = L5_1.ADD_VFO_TAKE_ACTION_ON_DAD
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
