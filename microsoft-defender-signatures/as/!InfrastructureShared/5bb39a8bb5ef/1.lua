local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
    L1_1 = L1_1.utf8p2
    L2_1 = L1_1
    L1_1 = L1_1.lower
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
L1_1 = {}
L2_1 = "winword.exe"
L3_1 = "excel.exe"
L4_1 = "powerpnt.exe"
L5_1 = "mspub.exe"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L2_1 = IsProcNameInParentProcessTree
L3_1 = "BM"
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = contains
L3_1 = L0_1
L4_1 = "process.*call.*create"
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = {}
  L5_1 = " powershell"
  L6_1 = " mshta javascript:"
  L7_1 = " regsvr32"
  L8_1 = " rundll32"
  L9_1 = " mshta"
  L10_1 = " certutil"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.add_related_string
    L3_1 = "proc_cmdline"
    L4_1 = L0_1
    L5_1 = bm
    L5_1 = L5_1.RelatedStringBMReport
    L2_1(L3_1, L4_1, L5_1)
    L2_1 = add_parents
    L2_1()
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
