local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = candidatePeFile
L0_1 = L0_1()
if L0_1 then
  L0_1 = {}
  L1_1 = hstrlog
  L1_1 = L1_1[3]
  L2_1 = hstrlog
  L2_1 = L2_1[4]
  L3_1 = hstrlog
  L3_1 = L3_1[5]
  L4_1 = hstrlog
  L4_1 = L4_1[6]
  L5_1 = hstrlog
  L5_1 = L5_1[7]
  L6_1 = hstrlog
  L6_1 = L6_1[8]
  L0_1[1] = L1_1
  L0_1[2] = L2_1
  L0_1[3] = L3_1
  L0_1[4] = L4_1
  L0_1[5] = L5_1
  L0_1[6] = L6_1
  L1_1 = 1
  L2_1 = #L0_1
  L3_1 = 1
  for L4_1 = L1_1, L2_1, L3_1 do
    L5_1 = L0_1[L4_1]
    L5_1 = L5_1.matched
    if L5_1 then
      L5_1 = L0_1[L4_1]
      L5_1 = L5_1.VA
      if L5_1 ~= -1 then
        L5_1 = pe
        L5_1 = L5_1.mmap_va
        L6_1 = L0_1[L4_1]
        L6_1 = L6_1.VA
        L7_1 = 30
        L5_1 = L5_1(L6_1, L7_1)
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L5_1
        L8_1 = "\014\000\a\128"
        L9_1 = 1
        L10_1 = true
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
        if L6_1 == nil then
          L7_1 = mp
          L7_1 = L7_1.INFECTED
          return L7_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
