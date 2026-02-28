local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nil
L2_1 = contains
L3_1 = L0_1
L4_1 = "powershell"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "cmd.exe"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "wscript"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "mshta"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "jscript"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "wmic"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "rundll32"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "regsvr32"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L1_1 = L1_1 + 1
end
if 1 < L1_1 then
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
