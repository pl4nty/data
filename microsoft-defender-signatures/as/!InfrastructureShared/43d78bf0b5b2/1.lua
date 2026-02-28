local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1.image_path
L4_1 = -12
L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
if L1_1 ~= "psexesvc.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 10) then
    goto lbl_42
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_42::
L4_1 = contains
L5_1 = L3_1
L6_1 = "\\share$\\"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = contains
  L5_1 = L3_1
  L6_1 = "\\admin$\\"
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = contains
    L5_1 = L3_1
    L6_1 = " \\\\"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = contains
      L5_1 = L3_1
      L6_1 = " \"\"\\\\"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        goto lbl_69
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_69::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
