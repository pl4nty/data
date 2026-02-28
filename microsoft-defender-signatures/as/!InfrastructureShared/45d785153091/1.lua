local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 <= 60) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = L2_1.image_path
  L3_1 = L3_1(L4_1)
  L5_1 = L3_1
  L4_1 = L3_1.match
  L6_1 = "([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= "cscript.exe" then
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= "wscript.exe" then
      goto lbl_45
    end
  end
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_45::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
