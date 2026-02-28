local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 256 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readheader
L1_1 = 0
L2_1 = 12
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == "\152\017\026E\144x\186\249N\214\143\238" then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "MpNonPIIFileType"
  L1_1(L2_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
