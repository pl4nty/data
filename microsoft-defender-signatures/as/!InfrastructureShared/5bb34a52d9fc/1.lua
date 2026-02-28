local L0_1, L1_1
L0_1 = analyzeRansomNotePattern
L1_1 = 1
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
