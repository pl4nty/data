local L0_1, L1_1, L2_1, L3_1
L0_1 = GetTaintLevelHR
L0_1 = L0_1()
if L0_1 == "High" then
  L1_1 = mp
  L1_1 = L1_1.IsHipsRuleEnabled
  L2_1 = "01443614-cd74-433a-b99e-2ecdc07bfc25"
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = mp
    L1_1 = L1_1.IsHipsRuleEnabled
    L2_1 = "c1db55ab-c21a-4637-bb3f-a12568109d35"
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      goto lbl_24
    end
  end
  L1_1 = AddResearchData
  L2_1 = "BM"
  L3_1 = true
  L1_1(L2_1, L3_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
::lbl_24::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
