local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    goto lbl_22
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_22::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= "explorer.exe" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L4_1 = #L3_1
  if not (L4_1 <= 40) then
    goto lbl_46
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_46::
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = {}
L5_1 = "code"
L6_1 = "mshta"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = containsall
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "%d%d%d%d$"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = string
L5_1 = L5_1.gsub
L6_1 = L3_1
L7_1 = "*"
L8_1 = ""
L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
if 4 <= L6_1 and L6_1 <= 20 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
