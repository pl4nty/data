local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = versioning
L0_1 = L0_1.IsSeville
L0_1 = L0_1()
if not L0_1 then
  L0_1 = versioning
  L0_1 = L0_1.IsServer
  L0_1 = L0_1()
  if not L0_1 then
    L0_1 = MpCommon
    L0_1 = L0_1.IsSampled
    L1_1 = 11000
    L2_1 = true
    L3_1 = true
    L4_1 = true
    L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
    if L0_1 == false then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = MpCommon
    L8_1 = L8_1.PathToWin32Path
    L9_1 = L6_1.image_path
    L8_1, L9_1, L10_1, L11_1 = L8_1(L9_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.IsKnownFriendlyFile
      L9_1 = L7_1
      L10_1 = true
      L11_1 = false
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if not L8_1 then
        L8_1 = L6_1.ppid
        if L8_1 ~= nil then
          L8_1 = bm
          L8_1 = L8_1.add_threat_process
          L9_1 = L6_1.ppid
          L8_1(L9_1)
        end
      end
    end
  end
end
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = L6_1.image_path
  if L7_1 ~= nil then
    L7_1 = string
    L7_1 = L7_1.lower
    L8_1 = MpCommon
    L8_1 = L8_1.PathToWin32Path
    L9_1 = L6_1.image_path
    L8_1, L9_1, L10_1, L11_1 = L8_1(L9_1)
    L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
    L8_1 = sysio
    L8_1 = L8_1.IsFileExists
    L9_1 = L7_1
    L8_1 = L8_1(L9_1)
    if L8_1 then
      L8_1 = mp
      L8_1 = L8_1.IsKnownFriendlyFile
      L9_1 = L7_1
      L10_1 = true
      L11_1 = false
      L8_1 = L8_1(L9_1, L10_1, L11_1)
      if not L8_1 then
        L8_1 = L6_1.ppid
        if L8_1 ~= nil then
          L8_1 = bm
          L8_1 = L8_1.add_threat_process
          L9_1 = L6_1.ppid
          L8_1(L9_1)
        end
      end
    end
  end
end
L2_1 = getCurrentProcessInjectors
L2_1, L3_1, L4_1 = L2_1()
if L4_1 ~= nil then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "GenRansom_injected"
  L7_1 = safeJsonSerialize
  L8_1 = L4_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
end
if L3_1 ~= nil then
  L5_1 = bm
  L5_1 = L5_1.add_related_string
  L6_1 = "GenRansom_injector"
  L7_1 = safeJsonSerialize
  L8_1 = L3_1
  L7_1 = L7_1(L8_1)
  L8_1 = bm
  L8_1 = L8_1.RelatedStringBMReport
  L5_1(L6_1, L7_1, L8_1)
end
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[8]
  L5_1 = L5_1.utf8p2
  if L5_1 then
    L5_1 = reportGenericRansomware
    L6_1 = this_sigattrlog
    L6_1 = L6_1[8]
    L6_1 = L6_1.utf8p2
    L5_1 = L5_1(L6_1)
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    if L5_1 == L6_1 then
      L5_1 = reportTimingData
      L5_1()
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
