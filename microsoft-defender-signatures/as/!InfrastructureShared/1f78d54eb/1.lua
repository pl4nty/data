local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = pe
L0_1 = L0_1.mmap_va
L1_1 = pehdr
L1_1 = L1_1.AddressOfEntryPoint
L2_1 = pehdr
L2_1 = L2_1.ImageBase
L1_1 = L1_1 + L2_1
L2_1 = 4
L0_1 = L0_1(L1_1, L2_1)
L1_1 = string
L1_1 = L1_1.byte
L2_1 = L0_1
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.byte
L3_1 = L0_1
L4_1 = 2
L2_1 = L2_1(L3_1, L4_1)
L3_1 = string
L3_1 = L3_1.byte
L4_1 = L0_1
L5_1 = 3
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.byte
L5_1 = L0_1
L6_1 = 4
L4_1 = L4_1(L5_1, L6_1)
L5_1 = opclog
L5_1 = L5_1[1]
L5_1 = L5_1.address
L6_1 = pehdr
L6_1 = L6_1.AddressOfEntryPoint
L7_1 = pehdr
L7_1 = L7_1.ImageBase
L6_1 = L6_1 + L7_1
if L5_1 == L6_1 and L1_1 == 226 and L2_1 == 254 and L3_1 == 106 and L4_1 == 0 then
  L5_1 = peattributes
  L5_1 = L5_1.packed
  if not L5_1 then
    L5_1 = peattributes
    L5_1 = L5_1.hasstandardentry
    if not L5_1 then
      L5_1 = mp
      L5_1 = L5_1.changedetectionname
      L6_1 = 268436398
      L5_1(L6_1)
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.SUSPICIOUS
return L5_1
