local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = string
L3_1 = L3_1.find
L4_1 = L2_1
L5_1 = "com.apple.webkit.networking"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = string
  L3_1 = L3_1.find
  L4_1 = L2_1
  L5_1 = "com.apple.safari.sandboxbroker"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L3_1 = IsExcludedByCmdlineMacOS
    L4_1 = L1_1
    L3_1 = L3_1(L4_1)
    if not L3_1 then
      L3_1 = IsExcludedByImagePathMacOS
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      if not L3_1 then
        goto lbl_39
      end
    end
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
::lbl_39::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[1]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[1]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[1]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[1]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsKeyValuePairInRollingQueue
L5_1 = "MAC_BROWSERDOWNLOAD_PATH"
L6_1 = "mac_browserdownload_path"
L7_1 = L3_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if not L4_1 then
  L4_1 = SuspMacPathsToMonitor
  L5_1 = L3_1
  L6_1 = true
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    goto lbl_78
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_78::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
