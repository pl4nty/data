local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L3_1 = this_sigattrlog
L3_1 = L3_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.utf8p1
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    L3_1 = L3_1.utf8p1
    if L3_1 ~= "" then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      L3_1 = L3_1.utf8p2
      if L3_1 ~= nil then
        L3_1 = this_sigattrlog
        L3_1 = L3_1[3]
        L3_1 = L3_1.utf8p2
        if L3_1 ~= "" then
          goto lbl_29
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_29::
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
L0_1 = L3_1
L3_1 = IsExcludedByImagePathMacOS
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.get_current_process_startup_info
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = IsExcludedByCmdlineMacOS
L5_1 = L3_1.command_line
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.utf8p1
L5_1 = L4_1
L4_1 = L4_1.match
L6_1 = "([^/]+)%s*%d*$"
L4_1 = L4_1(L5_1, L6_1)
L1_1 = L4_1
L4_1 = this_sigattrlog
L4_1 = L4_1[3]
L4_1 = L4_1.utf8p2
L5_1 = L4_1
L4_1 = L4_1.match
L6_1 = "([^/]+)%s*%d*$"
L4_1 = L4_1(L5_1, L6_1)
L2_1 = L4_1
if L1_1 ~= nil and L2_1 ~= nil and L1_1 ~= "" then
  L5_1 = L1_1
  L4_1 = L1_1.lower
  L4_1 = L4_1(L5_1)
  L6_1 = L2_1
  L5_1 = L2_1.lower
  L5_1 = L5_1(L6_1)
  if L4_1 == L5_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
