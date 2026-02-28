local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
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
L3_1 = ""
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L4_1 = L4_1.utf8p1
    if L4_1 ~= "" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = this_sigattrlog
      L5_1 = L5_1[4]
      L5_1 = L5_1.utf8p1
      L4_1 = L4_1(L5_1)
      L3_1 = L4_1
    end
  end
end
if L3_1 ~= "" then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L3_1
  L6_1 = "/private/var/folders/[^/]+/[^/]+/t/."
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == 1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
