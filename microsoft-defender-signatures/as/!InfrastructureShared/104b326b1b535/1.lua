local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.utf8p2
  if L4_1 ~= nil then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p2
    if L4_1 ~= "" then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L3_1 = L4_1.utf8p2
  end
end
else
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = " -wa "
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = string
  L5_1 = L5_1.find
  L6_1 = L4_1
  L7_1 = " -ga "
  L8_1 = 1
  L9_1 = true
  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
  if not L5_1 then
    L5_1 = string
    L5_1 = L5_1.find
    L6_1 = L4_1
    L7_1 = " -gwa "
    L8_1 = 1
    L9_1 = true
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
    if not L5_1 then
      L5_1 = string
      L5_1 = L5_1.find
      L6_1 = L4_1
      L7_1 = " -wga "
      L8_1 = 1
      L9_1 = true
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
      if not L5_1 then
        L5_1 = string
        L5_1 = L5_1.find
        L6_1 = L4_1
        L7_1 = " -a "
        L8_1 = 1
        L9_1 = true
        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
        if not L5_1 then
          L5_1 = string
          L5_1 = L5_1.find
          L6_1 = L4_1
          L7_1 = " -g "
          L8_1 = 1
          L9_1 = true
          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
          if not L5_1 then
            L5_1 = string
            L5_1 = L5_1.find
            L6_1 = L4_1
            L7_1 = " -w "
            L8_1 = 1
            L9_1 = true
            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
            if not L5_1 then
              L5_1 = string
              L5_1 = L5_1.find
              L6_1 = L4_1
              L7_1 = " -s "
              L8_1 = 1
              L9_1 = true
              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
              if not L5_1 then
                goto lbl_133
              end
            end
          end
        end
      end
    end
  end
end
L5_1 = TrackPidAndTechniqueBM
L6_1 = "BM"
L7_1 = "T1016"
L8_1 = "Discovery_NetworkConfDiscovery_SecurityFindPass"
L5_1(L6_1, L7_1, L8_1)
L5_1 = mp
L5_1 = L5_1.INFECTED
do return L5_1 end
::lbl_133::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
