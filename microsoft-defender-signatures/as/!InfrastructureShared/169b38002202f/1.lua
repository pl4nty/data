local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -33
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= "\\msexchangemailboxreplication.exe" then
    L1_1 = string
    L1_1 = L1_1.sub
    L2_1 = L0_1
    L3_1 = -23
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 ~= "\\msexchangedelivery.exe" then
      L1_1 = string
      L1_1 = L1_1.sub
      L2_1 = L0_1
      L3_1 = -39
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 ~= "\\msexchangemailboxreplicationworker.exe" then
        goto lbl_119
      end
    end
  end
  L1_1 = nil
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L1_1 = L2_1.utf8p1
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[2]
      L1_1 = L2_1.utf8p1
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[3]
      L2_1 = L2_1.matched
      if L2_1 then
        L2_1 = this_sigattrlog
        L2_1 = L2_1[3]
        L1_1 = L2_1.utf8p1
      else
        L2_1 = this_sigattrlog
        L2_1 = L2_1[4]
        L2_1 = L2_1.matched
        if L2_1 then
          L2_1 = this_sigattrlog
          L2_1 = L2_1[4]
          L1_1 = L2_1.utf8p1
        end
      end
    end
  end
  if L1_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.sub
    L3_1 = L1_1
    L4_1 = -4
    L2_1 = L2_1(L3_1, L4_1)
    L3_1 = "|.asp|aspx|ashx|asmx|"
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L3_1
    L6_1 = L2_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = sysio
    L4_1 = L4_1.IsFileExists
    L5_1 = L1_1
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = bm
      L4_1 = L4_1.add_related_file
      L5_1 = L1_1
      L4_1(L5_1)
      L4_1 = bm
      L4_1 = L4_1.add_threat_file
      L5_1 = L1_1
      L4_1(L5_1)
    end
    L4_1 = pcall
    L5_1 = reportBmInfo
    L4_1, L5_1 = L4_1(L5_1)
    if not L4_1 and L5_1 then
      L6_1 = bm
      L6_1 = L6_1.add_related_string
      L7_1 = "bmInfoFailReason"
      L8_1 = tostring
      L9_1 = L5_1
      L8_1 = L8_1(L9_1)
      L9_1 = bm
      L9_1 = L9_1.RelatedStringBMReport
      L6_1(L7_1, L8_1, L9_1)
    end
    L6_1 = mp
    L6_1 = L6_1.INFECTED
    return L6_1
  end
end
::lbl_119::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
