local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = L1_1.command_line
L4_1 = this_sigattrlog
L4_1 = L4_1[8]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[8]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[8]
      L0_1 = L4_1.utf8p1
  end
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[9]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[9]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= nil then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[9]
      L4_1 = L4_1.utf8p1
      if L4_1 ~= "" then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[9]
        L0_1 = L4_1.utf8p1
      end
    end
  end
end
if L0_1 ~= nil and L0_1 ~= "" then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "/System/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 ~= 1 then
    goto lbl_61
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_61::

function L4_1(A0_2)
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

ExtendedSuspMacPathsToMonitor = L4_1
L5_1 = L0_1
L4_1 = L0_1.match
L6_1 = "[^/]*$"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = IsExcludedByCmdlineMacOS
L6_1 = L3_1
L5_1 = L5_1(L6_1)
if not L5_1 then
  L5_1 = IsExcludedByImagePathMacOS
  L6_1 = L2_1
  L5_1 = L5_1(L6_1)
  if not L5_1 then
    L5_1 = IsPersistenceExcludedMacOS
    L6_1 = L4_1
    L7_1 = L2_1
    L8_1 = false
    L5_1 = L5_1(L6_1, L7_1, L8_1)
    if not L5_1 then
      goto lbl_86
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_86::
if L4_1 ~= nil and L4_1 ~= "" then
  L5_1 = IsKeyInRollingQueue
  L6_1 = "MAC_PERSIST_PROG_PATHS"
  L7_1 = L4_1
  L8_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1)
  if L5_1 then
    L5_1 = GetRollingQueueKeyValues
    L6_1 = "MAC_PERSIST_PROG_PATHS"
    L7_1 = L4_1
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 ~= nil then
      L6_1 = #L5_1
      if 0 < L6_1 then
        L6_1 = ipairs
        L7_1 = L5_1
        L6_1, L7_1, L8_1 = L6_1(L7_1)
        for L9_1, L10_1 in L6_1, L7_1, L8_1 do
          L11_1 = ExtendedSuspMacPathsToMonitor
          L12_1 = L10_1.value
          L11_1 = L11_1(L12_1)
          if L11_1 then
            L11_1 = IsPersistenceExcludedMacOS
            L12_1 = L4_1
            L13_1 = L10_1.value
            L14_1 = true
            L11_1 = L11_1(L12_1, L13_1, L14_1)
            if not L11_1 then
              L11_1 = bm
              L11_1 = L11_1.add_related_file
              L12_1 = L10_1.value
              L11_1(L12_1)
              L11_1 = bm
              L11_1 = L11_1.add_related_string
              L12_1 = "persisted_path"
              L13_1 = L10_1.value
              L14_1 = bm
              L14_1 = L14_1.RelatedStringBMReport
              L11_1(L12_1, L13_1, L14_1)
              L11_1 = mp
              L11_1 = L11_1.INFECTED
              return L11_1
            end
          end
        end
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
