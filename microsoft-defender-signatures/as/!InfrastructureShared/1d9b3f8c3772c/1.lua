local L0_1, L1_1, L2_1
L0_1 = IsTechniqueObservedGlobal
L1_1 = "ReverseShell"
L2_1 = true
L0_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L0_1 = addRelatedProcess
  L0_1()
  L0_1 = reportRelatedBmHits
  L0_1()
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
