local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L2_1 = L2_1.utf8p2
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[5]
    L2_1 = L2_1.utf8p2
    if L2_1 ~= "" then
      goto lbl_19
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_19::
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L0_1 = L2_1
L2_1 = IsExcludedByImagePathMacOS
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "Goblin.app/Contents/"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = string
  L2_1 = L2_1.find
  L3_1 = L0_1
  L4_1 = "/download-package/clickhouse"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if not L2_1 then
    goto lbl_52
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_52::
L2_1 = bm
L2_1 = L2_1.get_current_process_startup_info
L2_1 = L2_1()
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = L2_1.command_line
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L1_1 = L4_1.utf8p2
L4_1 = IsKeyValuePairInRollingQueue
L5_1 = "MAC_UNS_ADHOC_PATHS"
L6_1 = "unsigned_adhoc_items"
L7_1 = L0_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "^/Users/[^/]+/Desktop/[^/]+$"
  L7_1 = 1
  L8_1 = false
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "^/Users/[^/]+/Documents/[^/]+$"
    L7_1 = 1
    L8_1 = false
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.find
      L5_1 = L1_1
      L6_1 = "^/Users/[^/]+/Downloads/[^/]+$"
      L7_1 = 1
      L8_1 = false
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if not L4_1 then
        L4_1 = string
        L4_1 = L4_1.find
        L5_1 = L1_1
        L6_1 = "^/private/tmp/[^/]+$"
        L7_1 = 1
        L8_1 = false
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
        if not L4_1 then
          L4_1 = string
          L4_1 = L4_1.find
          L5_1 = L1_1
          L6_1 = "^/Users/[^/]+/Desktop/[^/]+/[^/]+$"
          L7_1 = 1
          L8_1 = false
          L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
          if not L4_1 then
            L4_1 = string
            L4_1 = L4_1.find
            L5_1 = L1_1
            L6_1 = "^/Users/[^/]+/Documents/[^/]+/[^/]+$"
            L7_1 = 1
            L8_1 = false
            L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
            if not L4_1 then
              L4_1 = string
              L4_1 = L4_1.find
              L5_1 = L1_1
              L6_1 = "^/Users/[^/]+/Downloads/[^/]+/[^/]+$"
              L7_1 = 1
              L8_1 = false
              L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
              if not L4_1 then
                L4_1 = string
                L4_1 = L4_1.find
                L5_1 = L1_1
                L6_1 = "^/private/tmp/[^/]+/[^/]+$"
                L7_1 = 1
                L8_1 = false
                L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
                if not L4_1 then
                  goto lbl_159
                end
              end
            end
          end
        end
      end
    end
  end
  L4_1 = bm
  L4_1 = L4_1.trigger_sig
  L5_1 = "BM_UnsignedProcCreatedUnsignedFile"
  L6_1 = L1_1
  L4_1(L5_1, L6_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
::lbl_159::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
