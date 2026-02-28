local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[3]
  L0_1 = L1_1.utf8p2
else
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 ~= 0 then
    goto lbl_24
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_24::
L1_1 = false
L3_1 = L0_1
L2_1 = L0_1.gmatch
L4_1 = "([^\r\n]*)\n?"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
for L5_1 in L2_1, L3_1, L4_1 do
  L6_1 = mp
  L6_1 = L6_1.ContextualExpandEnvironmentVariables
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  L5_1 = L6_1
  L6_1 = sysio
  L6_1 = L6_1.IsFileExists
  L7_1 = L5_1
  L6_1 = L6_1(L7_1)
  if L6_1 then
    L6_1 = mp
    L6_1 = L6_1.IsKnownFriendlyFile
    L7_1 = L5_1
    L8_1 = true
    L9_1 = false
    L6_1 = L6_1(L7_1, L8_1, L9_1)
    if L6_1 == false then
      L6_1 = bm
      L6_1 = L6_1.add_threat_file
      L7_1 = L5_1
      L6_1(L7_1)
      L1_1 = true
    end
  end
end
if L1_1 == true then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
