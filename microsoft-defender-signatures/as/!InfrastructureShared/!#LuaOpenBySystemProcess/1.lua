local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_PROCESS_ID
  L0_1 = L0_1(L1_1)
  if L0_1 == 4 then
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
