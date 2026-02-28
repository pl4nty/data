local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
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
    goto lbl_21
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_21::
L3_1 = nil
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L7_1 = L7_1.matched
if L7_1 then
  L7_1 = this_sigattrlog
  L7_1 = L7_1[2]
  L7_1 = L7_1.utf8p1
  if L7_1 ~= nil then
    L7_1 = this_sigattrlog
    L7_1 = L7_1[2]
    L7_1 = L7_1.utf8p1
    if L7_1 ~= "" then
      L7_1 = this_sigattrlog
      L7_1 = L7_1[2]
      L7_1 = L7_1.utf8p2
      if L7_1 ~= nil then
        L7_1 = this_sigattrlog
        L7_1 = L7_1[2]
        L7_1 = L7_1.utf8p2
        if L7_1 ~= "" then
          goto lbl_50
        end
      end
    end
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_50::
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L3_1 = L7_1.utf8p1
L7_1 = this_sigattrlog
L7_1 = L7_1[2]
L4_1 = L7_1.utf8p2
L7_1 = string
L7_1 = L7_1.find
L8_1 = L3_1
L9_1 = "/Applications/"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
if L7_1 == 1 then
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L4_1
  L9_1 = "/Applications/"
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 == 1 then
    goto lbl_77
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
do return L7_1 end
::lbl_77::
L7_1 = string
L7_1 = L7_1.match
L8_1 = L3_1
L9_1 = "^/.*/"
L7_1 = L7_1(L8_1, L9_1)
L5_1 = L7_1
L7_1 = string
L7_1 = L7_1.match
L8_1 = L4_1
L9_1 = "^/.*/"
L7_1 = L7_1(L8_1, L9_1)
L6_1 = L7_1
if L5_1 == nil and L5_1 == "" and L6_1 == nil and L6_1 == "" then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if L5_1 == L6_1 then
  L7_1 = TrackPidAndTechniqueBM
  L8_1 = "BM"
  L9_1 = "T1036.005"
  L10_1 = "DefenseEvasion_Masquerading_App"
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
