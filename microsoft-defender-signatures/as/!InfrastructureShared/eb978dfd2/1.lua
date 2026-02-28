local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "HSTR:Virtool:Win32/Obfuscator.ACP"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if 1 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.SUSPICIOUS
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.set_mpattribute
L1_1 = "do_exhaustivehstr_rescan"
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
