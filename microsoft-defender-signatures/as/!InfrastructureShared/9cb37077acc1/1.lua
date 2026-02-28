local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
      goto lbl_19
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_19::
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
      goto lbl_37
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_37::
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L2_1 = L3_1.utf8p1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L1_1 = L3_1.utf8p2
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "/%.[^/]+$"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = L2_1
  L3_1 = L2_1.match
  L5_1 = "^%.[^/]+$"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = string
L3_1 = L3_1.match
L4_1 = L1_1
L5_1 = "^/.*/"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = string
L4_1 = L4_1.match
L5_1 = L2_1
L6_1 = "^/.*/"
L4_1 = L4_1(L5_1, L6_1)
if L3_1 ~= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.get_imagepath
L5_1 = L5_1()
L0_1 = L5_1
L5_1 = IsExcludedByImagePathMacOS
L6_1 = L0_1
L5_1 = L5_1(L6_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.get_current_process_startup_info
L5_1 = L5_1()
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L5_1.command_line
L7_1 = IsExcludedByCmdlineMacOS
L8_1 = L6_1
L7_1 = L7_1(L8_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = IsKeyValuePairInRollingQueue
L8_1 = "MAC_UNS_ADHOC_PATHS"
L9_1 = "unsigned_adhoc_items"
L10_1 = L0_1
L7_1 = L7_1(L8_1, L9_1, L10_1)
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
