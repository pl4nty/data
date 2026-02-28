local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p2
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p2
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L0_1 = L3_1.utf8p2
    end
  end
end
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L1_1 = L3_1.utf8p1
      L3_1 = this_sigattrlog
      L3_1 = L3_1[2]
      L2_1 = L3_1.utf8p2
    end
  end
end
if L0_1 == nil or L0_1 == "" or L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = IsPersistenceExcludedMacOS
    L4_1 = L0_1
    L5_1 = L1_1
    L6_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1)
    if not L3_1 then
      goto lbl_71
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_71::

function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = SuspMacPathsToMonitor
  L2_2 = A0_2
  L3_2 = true
  L1_2 = L1_2(L2_2, L3_2)
  if L1_2 then
    L1_2 = true
    return L1_2
  end
  L2_2 = A0_2
  L1_2 = A0_2.find
  L3_2 = "^/Users/[^/]+/Desktop/"
  L4_2 = 1
  L5_2 = false
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.find
    L3_2 = "^/Users/[^/]+/Documents/"
    L4_2 = 1
    L5_2 = false
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
    if not L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.find
      L3_2 = "^/Users/[^/]+/Downloads/"
      L4_2 = 1
      L5_2 = false
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
      if not L1_2 then
        L2_2 = A0_2
        L1_2 = A0_2.find
        L3_2 = "^/Users/[^/]+/Library/[^/]+$"
        L4_2 = 1
        L5_2 = false
        L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
        if not L1_2 then
          L2_2 = A0_2
          L1_2 = A0_2.find
          L3_2 = "^/Users/[^/]+/Library/[^/]+/[^/]+$"
          L4_2 = 1
          L5_2 = false
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          if not L1_2 then
            L2_2 = A0_2
            L1_2 = A0_2.find
            L3_2 = "^/Library/[^/]+$"
            L4_2 = 1
            L5_2 = false
            L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
            if not L1_2 then
              L2_2 = A0_2
              L1_2 = A0_2.find
              L3_2 = "^/Library/[^/]+/[^/]+$"
              L4_2 = 1
              L5_2 = false
              L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
              if not L1_2 then
                goto lbl_60
              end
            end
          end
        end
      end
    end
  end
  L1_2 = true
  do return L1_2 end
  ::lbl_60::
  L1_2 = false
  return L1_2
end

ExtendedSuspMacPathsToMonitor = L3_1
L3_1 = IsKeyValuePairInRollingQueue
L4_1 = "MAC_UNS_ADHOC_PATHS"
L5_1 = "unsigned_adhoc_items"
L6_1 = L1_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L0_1
L3_1 = L0_1.match
L5_1 = "[^/]*$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= nil and L3_1 ~= "" then
  L4_1 = IsKeyInRollingQueue
  L5_1 = "MAC_PERSIST_PROG_PATHS"
  L6_1 = L3_1
  L7_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1)
  if L4_1 then
    L4_1 = GetRollingQueueKeyValues
    L5_1 = "MAC_PERSIST_PROG_PATHS"
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 ~= nil then
      L5_1 = #L4_1
      if 0 < L5_1 then
        L5_1 = ipairs
        L6_1 = L4_1
        L5_1, L6_1, L7_1 = L5_1(L6_1)
        for L8_1, L9_1 in L5_1, L6_1, L7_1 do
          L10_1 = ExtendedSuspMacPathsToMonitor
          L11_1 = L9_1.value
          L10_1 = L10_1(L11_1)
          if L10_1 then
            L10_1 = bm
            L10_1 = L10_1.add_related_string
            L11_1 = "persisted_path"
            L12_1 = L9_1.value
            L13_1 = bm
            L13_1 = L13_1.RelatedStringBMReport
            L10_1(L11_1, L12_1, L13_1)
            L10_1 = bm
            L10_1 = L10_1.add_related_file
            L11_1 = L9_1.value
            L10_1(L11_1)
            L10_1 = sysio
            L10_1 = L10_1.IsFileExists
            L11_1 = L9_1.value
            L10_1 = L10_1(L11_1)
            if L10_1 then
              L10_1 = bm
              L10_1 = L10_1.add_threat_file
              L11_1 = L9_1.value
              L10_1(L11_1)
            end
            L10_1 = mp
            L10_1 = L10_1.INFECTED
            return L10_1
          end
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
