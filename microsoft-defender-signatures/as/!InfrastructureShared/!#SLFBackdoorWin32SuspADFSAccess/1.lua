local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = IsADFSRole
L0_1 = L0_1()
if L0_1 then
  L0_1 = pcall
  L1_1 = mp
  L1_1 = L1_1.get_contextdata
  L2_1 = mp
  L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L0_1, L1_1 = L0_1(L1_1, L2_1)
  if L0_1 and L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    L1_1 = L2_1
    L2_1 = string
    L2_1 = L2_1.find
    L3_1 = L1_1
    L4_1 = "adfstoolbox"
    L5_1 = 1
    L6_1 = true
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    if not L2_1 then
      L2_1 = string
      L2_1 = L2_1.find
      L3_1 = L1_1
      L4_1 = "test.serviceaccount.ps1"
      L5_1 = 1
      L6_1 = true
      L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
      if not L2_1 then
        L2_1 = string
        L2_1 = L2_1.find
        L3_1 = L1_1
        L4_1 = "adfsserviceaccountmodule.psm1"
        L5_1 = 1
        L6_1 = true
        L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
        if not L2_1 then
          goto lbl_50
        end
      end
    end
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    do return L2_1 end
    ::lbl_50::
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
