local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "SLF:Win32/LnkFileWith"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.get_contextdata
  L1_1 = mp
  L1_1 = L1_1.CONTEXT_DATA_SCANREASON
  L0_1 = L0_1(L1_1)
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L1_1 then
    L0_1 = mp
    L0_1 = L0_1.get_contextdata
    L1_1 = mp
    L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
    L0_1 = L0_1(L1_1)
    if L0_1 == true then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      L1_1 = MpCommon
      L1_1 = L1_1.QueryPersistContextNoPath
      L2_1 = "CLF_AM"
      L3_1 = "OfcUsrTruDocRec"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 then
        L1_1 = mp
        L0_1 = L1_1.INFECTED
      end
      L1_1 = false
      L2_1 = MpCommon
      L2_1 = L2_1.QueryPersistContextNoPath
      L3_1 = "CLF_AM"
      L4_1 = "CLF_AM_EC"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L1_1 = true
      end
      L2_1 = MpCommon
      L2_1 = L2_1.QueryPersistContextNoPath
      L3_1 = "CLF_AM"
      L4_1 = "CLF_AM_WM"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 then
        L1_1 = true
      end
      if L1_1 then
        L2_1 = MpCommon
        L2_1 = L2_1.GetPersistContextNoPath
        L3_1 = "CLF_IC"
        L2_1 = L2_1(L3_1)
        L3_1 = ipairs
        L4_1 = L2_1
        L3_1, L4_1, L5_1 = L3_1(L4_1)
        for L6_1, L7_1 in L3_1, L4_1, L5_1 do
          L8_1 = mp
          L8_1 = L8_1.ReportLowfi
          L9_1 = L7_1
          L10_1 = 1933116662
          L8_1(L9_1, L10_1)
        end
        L3_1 = mp
        L0_1 = L3_1.INFECTED
      end
      L2_1 = mp
      L2_1 = L2_1.INFECTED
      if L0_1 == L2_1 then
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
