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
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = {}
L4_1 = "http"
L3_1[1] = L4_1
L4_1 = contains
L5_1 = L2_1
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 ~= nil then
  L5_1 = L4_1.image_path
  if L5_1 ~= nil then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = L4_1.image_path
    L5_1 = L5_1(L6_1)
    L7_1 = L5_1
    L6_1 = L5_1.match
    L8_1 = "([^\\]+)$"
    L6_1 = L6_1(L7_1, L8_1)
    L7_1 = {}
    L7_1["explorer.exe"] = true
    L8_1 = L7_1[L6_1]
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.INFECTED
      return L8_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.LOWFI
return L5_1
