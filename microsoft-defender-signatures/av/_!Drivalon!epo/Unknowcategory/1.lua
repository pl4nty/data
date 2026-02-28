local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = doshdr
L0_1 = L0_1.e_csum
if L0_1 ~= 22614 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = peattributes
L0_1 = L0_1.lastscn_falign
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = {}
L1_1.sig = "\137\208Jf\129:MZu\248\137\209\139I<\001"
L1_1.xray_type = 0
L1_1.bytes_to_decrypt = 0
L0_1[1] = L1_1
L1_1 = pe
L1_1 = L1_1.xray_block
L2_1 = L0_1
L3_1 = 1
L4_1 = -1
L5_1 = -2048
L6_1 = -1024
return L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
