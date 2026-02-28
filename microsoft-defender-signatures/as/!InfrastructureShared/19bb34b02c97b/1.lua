local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  L2_1 = L1_1
  L1_1 = L1_1.find
  L3_1 = "/kandji/kandji agent.app/"
  L1_1 = L1_1(L2_1, L3_1)
  if not L1_1 then
    goto lbl_18
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_18::
L1_1 = bm
L1_1 = L1_1.get_current_process_startup_info
L1_1 = L1_1()
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = L1_1.command_line
if L2_1 ~= nil and L2_1 ~= "" then
  L4_1 = L2_1
  L3_1 = L2_1.lower
  L3_1 = L3_1(L4_1)
  L4_1 = L3_1
  L3_1 = L3_1.find
  L5_1 = "/scripts/com.microsoft.wdav[^/]+/"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = L2_1
    L3_1 = L2_1.lower
    L3_1 = L3_1(L4_1)
    L4_1 = L3_1
    L3_1 = L3_1.find
    L5_1 = "script for mosyle mdm"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      goto lbl_48
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_48::
L3_1 = IsExcludedByCmdlineMacOS
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if not L3_1 then
  L3_1 = IsExcludedByImagePathMacOS
  L4_1 = L0_1
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
