local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_HAS_MOTW_ADS
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = mp
  L0_1 = L0_1.GetMOTWHostUrl
  L0_1 = L0_1()
  if L0_1 ~= nil then
    L2_1 = L0_1
    L1_1 = L0_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "outlook"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if not L1_1 then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "mail"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if not L1_1 then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "attach"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if not L1_1 then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "message"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if not L1_1 then
            goto lbl_69
          end
        end
      end
    end
    L1_1 = MpCommon
    L1_1 = L1_1.AppendPersistContextNoPath
    L2_1 = "CLF_AM"
    L3_1 = "CLF_AM_WM"
    L4_1 = 60
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = MpCommon
    L1_1 = L1_1.AppendPersistContextNoPath
    L2_1 = "CLF_IC"
    L3_1 = mp
    L3_1 = L3_1.getfilename
    L3_1 = L3_1()
    L4_1 = 60
    L1_1(L2_1, L3_1, L4_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
::lbl_69::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
