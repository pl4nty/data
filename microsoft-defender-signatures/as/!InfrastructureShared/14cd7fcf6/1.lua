local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = sysio
L0_1 = L0_1.RegOpenKey
L1_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.GetRegValueAsDword
  L2_1 = L0_1
  L3_1 = "TamperProtection"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L2_1 = mp
    L2_1 = L2_1.bitand
    L3_1 = L1_1
    L4_1 = 1
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == 1 then
      L2_1 = mp
      L2_1 = L2_1.SUSPICIOUS
      return L2_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
