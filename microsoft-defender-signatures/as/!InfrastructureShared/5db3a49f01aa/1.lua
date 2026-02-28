local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[2]
    L0_1 = L0_1.utf8p1
    if L0_1 ~= "" then
      L0_1 = this_sigattrlog
      L0_1 = L0_1[2]
      L0_1 = L0_1.utf8p2
      if L0_1 ~= nil then
        L0_1 = this_sigattrlog
        L0_1 = L0_1[2]
        L0_1 = L0_1.utf8p2
        if L0_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_29::
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.command_line
L2_1 = bm
L2_1 = L2_1.get_imagepath
L2_1 = L2_1()
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    goto lbl_59
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_59::
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.utf8p1
L4_1 = SuspMacPathsToMonitor
L5_1 = L3_1
L6_1 = true
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/Library/LaunchDaemons/"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = "/Library/LaunchAgents/"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "/%.[^/]+$"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil then
  L4_1 = L2_1
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L2_1
  L7_1 = "/bin/mv"
  L8_1 = -3
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if L5_1 ~= nil then
    L5_1 = mp
    L5_1 = L5_1.GetParentProcInfo
    L5_1 = L5_1()
    if L5_1 ~= nil then
      L6_1 = L5_1.image_path
      if L6_1 ~= nil then
        L4_1 = L5_1.image_path
      end
    end
  end
  L5_1 = SuspMacPathsToMonitor
  L6_1 = L4_1
  L7_1 = true
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "/Users/[^/]+/Downloads/"
    L8_1 = 1
    L9_1 = false
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "/Users/[^/]+/Documents/"
      L8_1 = 1
      L9_1 = false
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = "/Users/[^/]+/Desktop/"
        L8_1 = 1
        L9_1 = false
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          goto lbl_149
        end
      end
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  do return L5_1 end
  ::lbl_149::
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
