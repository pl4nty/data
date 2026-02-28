local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L4_1 = "[%'\"]%)?%+%(?[%'\"]"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L1_1 = L2_1
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = {}
L3_1 = "net group"
L2_1[1] = L3_1
L3_1 = contains
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetParentProcInfo
L3_1 = L3_1()
if L3_1 ~= nil then
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L3_1.image_path
  L4_1 = L4_1(L5_1)
  L6_1 = L4_1
  L5_1 = L4_1.match
  L7_1 = "([^\\]+)$"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= "cscript.exe" then
    L6_1 = L4_1
    L5_1 = L4_1.match
    L7_1 = "([^\\]+)$"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= "wscript.exe" then
      goto lbl_72
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
::lbl_72::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
