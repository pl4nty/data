local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 == L1_1 then
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_HAS_MOTW_ADS
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L1_1 = versioning
    L1_1 = L1_1.IsBeta
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.INFECTED
      return L1_1
    else
      L1_1 = mp
      L1_1 = L1_1.get_contextdata
      L2_1 = mp
      L2_1 = L2_1.CONTEXT_DATA_PROCESSNAME
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = ""
      end
      if L1_1 ~= "" then
        L3_1 = L1_1
        L2_1 = L1_1.lower
        L2_1 = L2_1(L3_1)
        L1_1 = L2_1
        L2_1 = {}
        L2_1["winword.exe"] = true
        L2_1["excel.exe"] = true
        L3_1 = L2_1[L1_1]
        if L3_1 then
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
