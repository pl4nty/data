local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = {}
L2_1 = "msteamssetup.exe"
L3_1 = "zoominstallerfull.exe"
L4_1 = "mssetup.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.GetCertificateInfo
  L2_1 = L2_1()
  L3_1 = pairs
  L4_1 = L2_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = L7_1.Signers
    if L8_1 == nil then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
