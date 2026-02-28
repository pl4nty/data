local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 ~= 0 then
    goto lbl_28
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_28::
L2_1 = L0_1
L1_1 = L0_1.gmatch
L3_1 = "([^\r\n]*)\n?"
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
for L4_1 in L1_1, L2_1, L3_1 do
  L5_1 = pcall
  L6_1 = mp
  L6_1 = L6_1.ContextualExpandEnvironmentVariables
  L7_1 = L4_1
  L5_1, L6_1 = L5_1(L6_1, L7_1)
  if L5_1 and L6_1 then
    L7_1 = sysio
    L7_1 = L7_1.IsFileExists
    L8_1 = L6_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = bm
      L7_1 = L7_1.add_related_file
      L8_1 = L6_1
      L7_1(L8_1)
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
