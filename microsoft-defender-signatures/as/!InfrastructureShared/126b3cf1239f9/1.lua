local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
end
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    if L1_1 ~= nil then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[2]
      L0_1 = L1_1.utf8p2
  end
  else
    L1_1 = this_sigattrlog
    L1_1 = L1_1[3]
    L1_1 = L1_1.matched
    if L1_1 then
      L1_1 = this_sigattrlog
      L1_1 = L1_1[3]
      L1_1 = L1_1.utf8p2
      if L1_1 ~= nil then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[3]
        L0_1 = L1_1.utf8p2
    end
    else
      L1_1 = this_sigattrlog
      L1_1 = L1_1[4]
      L1_1 = L1_1.matched
      if L1_1 then
        L1_1 = this_sigattrlog
        L1_1 = L1_1[4]
        L1_1 = L1_1.utf8p2
        if L1_1 ~= nil then
          L1_1 = this_sigattrlog
          L1_1 = L1_1[4]
          L0_1 = L1_1.utf8p2
        end
      end
    end
  end
end
if L0_1 ~= nil then
  L1_1 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.rtf|.js|.vbs|.wsf|.jse|.vbe|"
  L2_1 = bm_AddRelatedFileFromCommandLine
  L3_1 = L0_1
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
  L2_1 = this_sigattrlog
  L2_1 = L2_1[9]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = this_sigattrlog
    L3_1 = L3_1[9]
    L3_1 = L3_1.utf8p1
    L4_1 = 147270772
    L2_1(L3_1, L4_1)
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[10]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = this_sigattrlog
    L3_1 = L3_1[10]
    L3_1 = L3_1.utf8p1
    L4_1 = 982105579
    L2_1(L3_1, L4_1)
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[11]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = this_sigattrlog
    L3_1 = L3_1[11]
    L3_1 = L3_1.utf8p1
    L4_1 = 1815722029
    L2_1(L3_1, L4_1)
  end
  L2_1 = this_sigattrlog
  L2_1 = L2_1[12]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = this_sigattrlog
    L3_1 = L3_1[12]
    L3_1 = L3_1.utf8p1
    L4_1 = 1078932623
    L2_1(L3_1, L4_1)
  end
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
