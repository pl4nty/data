local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 12) then
    goto lbl_26
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_26::
L1_1 = mp
L1_1 = L1_1.GetExecutablesFromCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L2_1 = nil
if L1_1 then
  L3_1 = ipairs
  L4_1 = L1_1
  L3_1, L4_1, L5_1 = L3_1(L4_1)
  for L6_1, L7_1 in L3_1, L4_1, L5_1 do
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L7_1
    L10_1 = ":\\users\\"
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if L8_1 then
      L8_1 = MpCommon
      L8_1 = L8_1.QueryPersistContext
      L9_1 = L7_1
      L10_1 = "SystemDropToUserProfile.A"
      L8_1 = L8_1(L9_1, L10_1)
      if L8_1 then
        L2_1 = L7_1
        break
      end
    end
  end
end
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 12) then
    goto lbl_65
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_65::
L3_1 = {}
L4_1 = "psexesvc.exe"
L5_1 = "wmiprvse.exe"
L6_1 = "wmic.exe"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L4_1 = IsProcNameInParentProcessTree
L5_1 = "BM"
L6_1 = L3_1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
