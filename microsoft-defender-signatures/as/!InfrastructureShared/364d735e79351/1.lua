local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
  L4_1 = "\\windows\\system32\\dllhost.exe"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = MpCommon
    L2_1 = L2_1.GetPersistContextCountNoPath
    L3_1 = "UACBypassRegSet.B"
    L2_1 = L2_1(L3_1)
    if 0 < L2_1 then
      L2_1 = MpCommon
      L2_1 = L2_1.GetPersistContextNoPath
      L3_1 = "UACBypassRegSet.B"
      L2_1 = L2_1(L3_1)
      if L2_1 then
        L3_1 = ipairs
        L4_1 = L2_1
        L3_1, L4_1, L5_1 = L3_1(L4_1)
        for L6_1, L7_1 in L3_1, L4_1, L5_1 do
          L8_1 = string
          L8_1 = L8_1.lower
          L9_1 = L7_1
          L8_1 = L8_1(L9_1)
          L9_1 = string
          L9_1 = L9_1.lower
          L10_1 = L0_1.ppid
          L9_1 = L9_1(L10_1)
          if L8_1 == L9_1 then
            L8_1 = versioning
            L8_1 = L8_1.GetCloudBlockLevel
            L8_1 = L8_1()
            if 4 <= L8_1 then
              L8_1 = mp
              L8_1 = L8_1.INFECTED
              return L8_1
            end
            L8_1 = mp
            L8_1 = L8_1.LOWFI
            return L8_1
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
