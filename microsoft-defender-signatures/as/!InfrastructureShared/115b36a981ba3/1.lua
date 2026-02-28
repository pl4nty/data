local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
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
L3_1 = bm
L3_1 = L3_1.get_connection_string
L3_1 = L3_1()
if L3_1 == nil or L3_1 == "" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "Uri=([^;]*);"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == nil or L4_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "://([^/:]+%.kr)/"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = this_sigattrlog
L6_1 = L6_1[3]
L6_1 = L6_1.matched
if L6_1 then
  L6_1 = this_sigattrlog
  L6_1 = L6_1[3]
  L6_1 = L6_1.utf8p2
  if L6_1 ~= nil then
    L6_1 = this_sigattrlog
    L6_1 = L6_1[3]
    L6_1 = L6_1.utf8p2
    if L6_1 ~= "" then
      goto lbl_76
    end
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_76::
L6_1 = this_sigattrlog
L6_1 = L6_1[3]
L6_1 = L6_1.utf8p2
L7_1 = nil
L8_1 = this_sigattrlog
L8_1 = L8_1[5]
L8_1 = L8_1.matched
if L8_1 then
  L8_1 = this_sigattrlog
  L8_1 = L8_1[5]
  L7_1 = L8_1.utf8p2
else
  L8_1 = this_sigattrlog
  L8_1 = L8_1[6]
  L8_1 = L8_1.matched
  if L8_1 then
    L8_1 = this_sigattrlog
    L8_1 = L8_1[6]
    L7_1 = L8_1.utf8p2
  end
end
if L7_1 == nil or L7_1 == "" then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L9_1 = L6_1
L8_1 = L6_1.match
L10_1 = "[^/]*$"
L8_1 = L8_1(L9_1, L10_1)
L9_1 = string
L9_1 = L9_1.find
L10_1 = L7_1
L11_1 = L8_1
L12_1 = 1
L13_1 = true
L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
if not L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.INFECTED
return L9_1
