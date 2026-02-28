local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = candidatePeFile
L0_1 = L0_1()
if L0_1 then
  L0_1 = hstrlog
  L0_1 = L0_1[3]
  L0_1 = L0_1.matched
  if L0_1 then
    L0_1 = hstrlog
    L0_1 = L0_1[3]
    L0_1 = L0_1.VA
    if L0_1 ~= -1 then
      L0_1 = pe
      L0_1 = L0_1.mmap_va
      L1_1 = hstrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.VA
      L2_1 = 30
      L0_1 = L0_1(L1_1, L2_1)
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "H\133\192"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
