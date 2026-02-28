local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.image_path
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L0_1.image_path
    L4_1 = -14
    L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1, L4_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
    if L1_1 == "powershell.exe" then
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
      L4_1 = StringEndsWith
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = L3_1
      L5_1 = L5_1(L6_1)
      L6_1 = ".jsc"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
