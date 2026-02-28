local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = L0_1.image_path
  if not L2_1 then
    L2_1 = ""
  end
  L1_1 = L1_1(L2_1)
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L1_1
  L4_1 = "\\windows\\system32\\"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L3_1 = L1_1
    L2_1 = L1_1.match
    L4_1 = "([^\\]+)$"
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 ~= "fodhelper.exe" then
      L3_1 = L1_1
      L2_1 = L1_1.match
      L4_1 = "([^\\]+)$"
      L2_1 = L2_1(L3_1, L4_1)
      if L2_1 ~= "computerdefaults.exe" then
        goto lbl_93
      end
    end
    L2_1 = mp
    L2_1 = L2_1.GetScannedPPID
    L2_1 = L2_1()
    if L2_1 == nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = mp
    L3_1 = L3_1.GetProcessCommandLine
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    if L3_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "([^\\ ]+%.py)"
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == nil then
      L5_1 = mp
      L5_1 = L5_1.CLEAN
      return L5_1
    end
    L5_1 = MpCommon
    L5_1 = L5_1.GetPersistContextCountNoPath
    L6_1 = "UACBypassRegSetData"
    L5_1 = L5_1(L6_1)
    if 0 < L5_1 then
      L5_1 = MpCommon
      L5_1 = L5_1.GetPersistContextNoPath
      L6_1 = "UACBypassRegSetData"
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L6_1 = ipairs
        L7_1 = L5_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = string
          L11_1 = L11_1.find
          L12_1 = L10_1
          L13_1 = L4_1
          L14_1 = 1
          L15_1 = true
          L11_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
          if L11_1 then
            L11_1 = mp
            L11_1 = L11_1.INFECTED
            return L11_1
          end
        end
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
  end
end
::lbl_93::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
