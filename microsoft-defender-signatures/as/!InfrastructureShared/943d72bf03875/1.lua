local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L0_1
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 then
  L2_1 = #L1_1
  if not (L2_1 < 30) then
    L2_1 = #L1_1
    if not (400 < L2_1) then
      goto lbl_29
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_29::
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.image_path
  if L3_1 ~= nil then
    goto lbl_40
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_40::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "([^\\]+)$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == "explorer.exe" then
  L4_1 = contains
  L5_1 = L1_1
  L6_1 = " "
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
