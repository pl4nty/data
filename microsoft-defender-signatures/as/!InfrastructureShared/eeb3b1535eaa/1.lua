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
L1_1 = contains
L2_1 = L0_1
L3_1 = "download"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = contains
  L2_1 = L0_1
  L3_1 = "frombase64string"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_39
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
goto lbl_68
::lbl_39::
L1_1 = contains
L2_1 = L0_1
L3_1 = "%-[eE][ncodNCOD]*%s+"
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = NormalizeCmdline
  L2_1 = "powershell"
  L3_1 = L0_1
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = contains
  L3_1 = L1_1
  L4_1 = "download"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = contains
    L3_1 = L1_1
    L4_1 = "frombase64string"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      goto lbl_68
    end
  end
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
::lbl_68::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
