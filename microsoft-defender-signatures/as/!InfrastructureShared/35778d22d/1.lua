local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 10 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.IsTrustedFile
  L1_1 = false
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = mp
    L0_1 = L0_1.IsKnownFriendlyFile
    L1_1 = mp
    L1_1 = L1_1.getfilename
    L1_1 = L1_1()
    L2_1 = true
    L3_1 = true
    L0_1 = L0_1(L1_1, L2_1, L3_1)
    if not L0_1 then
      L0_1 = mp
      L0_1 = L0_1.INFECTED
      return L0_1
    end
  end
else
  L0_1 = pe
  L0_1 = L0_1.set_peattribute
  L1_1 = "hstr_exhaustive"
  L2_1 = true
  L0_1(L1_1, L2_1)
  L0_1 = pe
  L0_1 = L0_1.set_peattribute
  L1_1 = "enable_vmm_grow"
  L2_1 = true
  L0_1(L1_1, L2_1)
  L0_1 = pe
  L0_1 = L0_1.set_peattribute
  L1_1 = "deep_analysis"
  L2_1 = true
  L0_1(L1_1, L2_1)
  L0_1 = pe
  L0_1 = L0_1.set_peattribute
  L1_1 = "disable_seh_limit"
  L2_1 = true
  L0_1(L1_1, L2_1)
  L0_1 = pe
  L0_1 = L0_1.set_peattribute
  L1_1 = "disable_apicall_limit"
  L2_1 = true
  L0_1(L1_1, L2_1)
  L0_1 = pe
  L0_1 = L0_1.reemulate
  L0_1()
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
