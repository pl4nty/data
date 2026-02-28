local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = extractDllForRegproc
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = ":\\windows\\"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = contains
  L3_1 = L0_1
  L4_1 = "\\spool\\drivers\\"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = checkFileLastWriteTime
  L3_1 = L1_1
  L4_1 = 3600
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == false then
    L2_1 = mp
    L2_1 = L2_1.IsKnownFriendlyFile
    L3_1 = L1_1
    L4_1 = true
    L5_1 = false
    L2_1 = L2_1(L3_1, L4_1, L5_1)
    if L2_1 == false then
      L2_1 = bm
      L2_1 = L2_1.add_related_file
      L3_1 = L1_1
      L2_1(L3_1)
      L2_1 = {}
      L3_1 = "winword.exe"
      L4_1 = "excel.exe"
      L5_1 = "powerpnt.exe"
      L6_1 = "mspub.exe"
      L7_1 = "wscript.exe"
      L8_1 = "cscript.exe"
      L9_1 = "mshta.exe"
      L10_1 = "powershell.exe"
      L11_1 = "pwsh.exe"
      L12_1 = "wmic.exe"
      L13_1 = "wmiprvse.exe"
      L2_1[1] = L3_1
      L2_1[2] = L4_1
      L2_1[3] = L5_1
      L2_1[4] = L6_1
      L2_1[5] = L7_1
      L2_1[6] = L8_1
      L2_1[7] = L9_1
      L2_1[8] = L10_1
      L2_1[9] = L11_1
      L2_1[10] = L12_1
      L2_1[11] = L13_1
      L3_1 = IsProcNameInParentProcessTree
      L4_1 = "BM"
      L5_1 = L2_1
      L6_1 = 2
      L3_1 = L3_1(L4_1, L5_1, L6_1)
      if L3_1 then
        L3_1 = add_parents
        L3_1()
        L3_1 = mp
        L3_1 = L3_1.INFECTED
        return L3_1
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
