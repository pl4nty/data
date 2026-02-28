local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
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
    goto lbl_26
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_26::
L3_1 = versioning
L3_1 = L3_1.GetOrgID
L3_1 = L3_1()
if L3_1 ~= nil and L3_1 ~= "" then
  L5_1 = L3_1
  L4_1 = L3_1.lower
  L4_1 = L4_1(L5_1)
  if L4_1 == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
    goto lbl_40
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_40::
L4_1 = IsKeyValuePairInRollingQueue
L5_1 = "MAC_UNS_ADHOC_PATHS"
L6_1 = "unsigned_adhoc_items"
L7_1 = L2_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
