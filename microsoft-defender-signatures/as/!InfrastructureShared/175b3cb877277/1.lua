local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = MpCommon
L1_1 = L1_1.GetProcessProtection
L2_1 = L0_1.ppid
L1_1, L2_1 = L1_1(L2_1)
if L1_1 and L1_1 == 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L4_1 = L4_1.utf8p1
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[4]
    L3_1 = L4_1.utf8p1
end
else
  L4_1 = this_sigattrlog
  L4_1 = L4_1[5]
  L4_1 = L4_1.matched
  if L4_1 then
    L4_1 = this_sigattrlog
    L4_1 = L4_1[5]
    L4_1 = L4_1.utf8p1
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[5]
      L3_1 = L4_1.utf8p1
  end
  else
    L4_1 = this_sigattrlog
    L4_1 = L4_1[6]
    L4_1 = L4_1.matched
    if L4_1 then
      L4_1 = this_sigattrlog
      L4_1 = L4_1[6]
      L4_1 = L4_1.utf8p1
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[6]
        L3_1 = L4_1.utf8p1
    end
    else
      L4_1 = this_sigattrlog
      L4_1 = L4_1[7]
      L4_1 = L4_1.matched
      if L4_1 then
        L4_1 = this_sigattrlog
        L4_1 = L4_1[7]
        L4_1 = L4_1.utf8p1
        if L4_1 then
          L4_1 = this_sigattrlog
          L4_1 = L4_1[7]
          L3_1 = L4_1.utf8p1
        end
      end
    end
  end
end
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetParentProcInfo
L4_1 = L4_1()
if L4_1 then
  L5_1 = L4_1.ppid
  if L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.GetProcessProtection
    L6_1 = L4_1.ppid
    L5_1, L6_1 = L5_1(L6_1)
    if L5_1 and L5_1 == 0 then
      L7_1 = L4_1.image_path
      if L7_1 then
        L7_1 = L4_1.image_path
        L8_1 = L7_1
        L7_1 = L7_1.match
        L9_1 = "([^\\]+)$"
        L7_1 = L7_1(L8_1, L9_1)
        if not L7_1 then
          L7_1 = ""
        end
        L9_1 = L3_1
        L8_1 = L3_1.match
        L10_1 = "([^\\]+)$"
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          L8_1 = ""
        end
        L9_1 = mp
        L9_1 = L9_1.IsKnownFriendlyFile
        L10_1 = L4_1.image_path
        L11_1 = true
        L12_1 = false
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if L9_1 then
          L9_1 = string
          L9_1 = L9_1.lower
          L10_1 = L8_1
          L9_1 = L9_1(L10_1)
          L10_1 = string
          L10_1 = L10_1.lower
          L11_1 = L7_1
          L10_1 = L10_1(L11_1)
          if L9_1 == L10_1 then
            L9_1 = mp
            L9_1 = L9_1.CLEAN
            return L9_1
          end
        end
        L9_1 = checkParentCmdlineCaseInsensitive
        L10_1 = L0_1.ppid
        L11_1 = {}
        L12_1 = {}
        L13_1 = "svchost"
        L14_1 = "WerSvcGroup"
        L12_1[1] = L13_1
        L12_1[2] = L14_1
        L11_1[1] = L12_1
        L12_1 = 3
        L9_1 = L9_1(L10_1, L11_1, L12_1)
        if L9_1 then
          L9_1 = mp
          L9_1 = L9_1.CLEAN
          return L9_1
        end
        L9_1 = bm
        L9_1 = L9_1.add_related_string
        L10_1 = "PPlProcessParent"
        L11_1 = L4_1.image_path
        L12_1 = bm
        L12_1 = L12_1.RelatedStringBMReport
        L9_1(L10_1, L11_1, L12_1)
      end
      L7_1 = bm
      L7_1 = L7_1.add_related_string
      L8_1 = "PPlLevel"
      L9_1 = L5_1
      L10_1 = "_"
      L11_1 = L2_1 or L11_1
      if not L2_1 then
        L11_1 = "Error"
      end
      L9_1 = L9_1 .. L10_1 .. L11_1
      L10_1 = bm
      L10_1 = L10_1.RelatedStringBMReport
      L7_1(L8_1, L9_1, L10_1)
      L7_1 = add_parents
      L7_1()
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
