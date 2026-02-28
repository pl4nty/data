local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L0_1 = mp
  L0_1 = L0_1.IOAVGetDownloadUrl
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.len
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if 30 < L1_1 then
      L2_1 = L0_1
      L1_1 = L0_1.find
      L3_1 = ":3000/attacks/download?"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 then
        L1_1 = mp
        L1_1 = L1_1.INFECTED
        return L1_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
