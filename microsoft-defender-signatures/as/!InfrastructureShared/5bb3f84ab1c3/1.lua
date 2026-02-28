local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = getCurrentProcessInjectors
L0_1, L1_1, L2_1 = L0_1()
L3_1 = L2_1.count
if 5 <= L3_1 then
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "injection_relationship"
  L5_1 = safeJsonSerialize
  L6_1 = L0_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "GenRansom_injected"
  L5_1 = safeJsonSerialize
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_string
  L4_1 = "GenRansom_injector"
  L5_1 = safeJsonSerialize
  L6_1 = L1_1
  L5_1 = L5_1(L6_1)
  L6_1 = bm
  L6_1 = L6_1.RelatedStringBMReport
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.get_process_relationships
  L3_1, L4_1 = L3_1()
  L5_1 = ipairs
  L6_1 = L3_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.image_path
    if L10_1 ~= nil then
      L10_1 = string
      L10_1 = L10_1.lower
      L11_1 = MpCommon
      L11_1 = L11_1.PathToWin32Path
      L12_1 = L9_1.image_path
      L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1)
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      L11_1 = sysio
      L11_1 = L11_1.IsFileExists
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.IsKnownFriendlyFile
        L12_1 = L10_1
        L13_1 = true
        L14_1 = false
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        if not L11_1 then
          L11_1 = L9_1.ppid
          if L11_1 ~= nil then
            L11_1 = bm
            L11_1 = L11_1.add_threat_process
            L12_1 = L9_1.ppid
            L11_1(L12_1)
          end
          L11_1 = bm
          L11_1 = L11_1.add_threat_file
          L12_1 = L10_1
          L11_1(L12_1)
        end
      end
    end
  end
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = L9_1.image_path
    if L10_1 ~= nil then
      L10_1 = string
      L10_1 = L10_1.lower
      L11_1 = MpCommon
      L11_1 = L11_1.PathToWin32Path
      L12_1 = L9_1.image_path
      L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1)
      L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
      L11_1 = sysio
      L11_1 = L11_1.IsFileExists
      L12_1 = L10_1
      L11_1 = L11_1(L12_1)
      if L11_1 then
        L11_1 = mp
        L11_1 = L11_1.IsKnownFriendlyFile
        L12_1 = L10_1
        L13_1 = true
        L14_1 = false
        L11_1 = L11_1(L12_1, L13_1, L14_1)
        if not L11_1 then
          L11_1 = L9_1.ppid
          if L11_1 ~= nil then
            L11_1 = bm
            L11_1 = L11_1.add_threat_process
            L12_1 = L9_1.ppid
            L11_1(L12_1)
          end
          L11_1 = bm
          L11_1 = L11_1.add_threat_file
          L12_1 = L10_1
          L11_1(L12_1)
        end
      end
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
