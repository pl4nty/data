local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 == nil or L0_1 == "" then
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
    goto lbl_28
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_28::
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[8]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[8]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[8]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[8]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
if L3_1 == "" or L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = nil
L5_1 = this_sigattrlog
L5_1 = L5_1[7]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[7]
  L5_1 = L5_1.utf8p2
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[7]
    L5_1 = L5_1.utf8p2
    if L5_1 ~= "" then
      L5_1 = this_sigattrlog
      L5_1 = L5_1[7]
      L4_1 = L5_1.utf8p2
  end
end
else
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
if L4_1 == "" or L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L3_1
L7_1 = "/private/tmp/update"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "xattr -c"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = "xattr -d"
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = "xattr -rc"
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = "xattr -rd"
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        goto lbl_165
      end
    end
  end
end
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = "([^/]+)$"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 ~= "" and L5_1 ~= nil then
  L6_1 = string
  L6_1 = L6_1.find
  L7_1 = L4_1
  L8_1 = L5_1
  L9_1 = 1
  L10_1 = true
  L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
  if L6_1 then
    L6_1 = sysio
    L6_1 = L6_1.IsFileExists
    L7_1 = L3_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = bm
      L6_1 = L6_1.add_threat_file
      L7_1 = L3_1
      L6_1(L7_1)
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
::lbl_165::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
