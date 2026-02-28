local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
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
L2_1 = L0_1
L1_1 = L0_1.gmatch
L3_1 = "([^\r\n]*)\n?"
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
for L4_1 in L1_1, L2_1, L3_1 do
  L5_1 = mp
  L5_1 = L5_1.ContextualExpandEnvironmentVariables
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L4_1 = L5_1
  L5_1 = sysio
  L5_1 = L5_1.IsFileExists
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = bm
    L5_1 = L5_1.add_related_file
    L6_1 = L4_1
    L5_1(L6_1)
  end
end
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1037.001"
L4_1 = "persistence_source"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
