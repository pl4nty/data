local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.utf8p1
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 3) then
    goto lbl_20
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_20::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "totalrecoveryprosetup.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "miniconda3.+windows%-x86_64.exe"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "llvm%-.+%-win%d%d%.exe$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "gimp%-.+%.exe$"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\\microsoft\\windows defender.+\\datacollection\\"
        L1_1 = L1_1(L2_1, L3_1)
        if not L1_1 then
          goto lbl_65
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_65::
L1_1 = IsSenseRelatedProc
L1_1 = L1_1()
if L1_1 == true then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.ContextualExpandEnvironmentVariables
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = sysio
L2_1 = L2_1.IsFileExists
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.IsKnownFriendlyFile
  L3_1 = L1_1
  L4_1 = true
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 ~= true then
    goto lbl_93
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_93::
L2_1 = mp
L2_1 = L2_1.ReportLowfi
L3_1 = L1_1
L4_1 = 31011691
L2_1(L3_1, L4_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
