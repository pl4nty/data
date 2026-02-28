local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = hstrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
L2_1 = hstrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L0_1 then
  L3_1 = 1
  if L3_1 then
    goto lbl_16
  end
end
L3_1 = 0
::lbl_16::
if L1_1 then
  L4_1 = 1
  if L4_1 then
    goto lbl_22
  end
end
L4_1 = 0
::lbl_22::
L3_1 = L3_1 + L4_1
if L2_1 then
  L4_1 = 1
  if L4_1 then
    goto lbl_29
  end
end
L4_1 = 0
::lbl_29::
L3_1 = L3_1 + L4_1
if 2 <= L3_1 then
  L4_1 = mp
  L4_1 = L4_1.SUSPICIOUS
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.set_mpattribute
L5_1 = "HSTR:VirTool:Win32/Obfuscator.AFG"
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
