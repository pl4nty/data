local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_33
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_33::
L3_1 = IsKeyValuePairInRollingQueue
L4_1 = "MAC_UNS_ADHOC_PATHS"
L5_1 = "unsigned_adhoc_items"
L6_1 = L0_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.find
  L5_1 = "%s+/tmp/"
  L6_1 = 1
  L7_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.find
    L5_1 = "%s+/private/tmp/"
    L6_1 = 1
    L7_1 = false
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      L4_1 = L2_1
      L3_1 = L2_1.find
      L5_1 = "%s+/Users/Shared/"
      L6_1 = 1
      L7_1 = false
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if not L3_1 then
        L4_1 = L2_1
        L3_1 = L2_1.find
        L5_1 = "%s+/Users/."
        L6_1 = 1
        L7_1 = false
        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
        if not L3_1 then
          L4_1 = L2_1
          L3_1 = L2_1.find
          L5_1 = "%s+/Users/[^/]+/."
          L6_1 = 1
          L7_1 = false
          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
          if not L3_1 then
            L4_1 = L2_1
            L3_1 = L2_1.find
            L5_1 = "%s+/Users/[^/]+/Downloads/"
            L6_1 = 1
            L7_1 = false
            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
            if not L3_1 then
              L4_1 = L2_1
              L3_1 = L2_1.find
              L5_1 = "%s+/Library/Caches/"
              L6_1 = 1
              L7_1 = false
              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
              if not L3_1 then
                L4_1 = L2_1
                L3_1 = L2_1.find
                L5_1 = "%s+~/."
                L6_1 = 1
                L7_1 = false
                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                if not L3_1 then
                  goto lbl_99
                end
              end
            end
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
do return L3_1 end
::lbl_99::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
