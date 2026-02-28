local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1536000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.bitor
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FNAME
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_PATH
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_LOWERCASE
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1)
L4_1 = L1_1
L3_1 = L1_1.find
L5_1 = "\\downloads"
L6_1 = 1
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L3_1[".xls->"] = "%.xls%->.+"
L3_1["xlsx->"] = "%.xlsx%->.+"
L3_1[".doc->"] = "%.doc%->.+"
L3_1["docx->"] = "%.docx%->.+"
L3_1[".rtf->"] = "%.rtf%->.+"
L3_1["xlsm->"] = "%.xlsm%->.+"
L3_1["xlsb->"] = "%.xlsb%->.+"
L3_1["xltx->"] = "%.xltx%->.+"
L3_1["xltm->"] = "%.xltm%->.+"
L3_1["xlam->"] = "%.xlam%->.+"
L3_1[".xla->"] = "%.xla%->.+"
L3_1["docm->"] = "%.docm%->.+"
L3_1["dotx->"] = "%.dotx%->.+"
L3_1["dotm->"] = "%.dotm%->.+"
L3_1[".ppt->"] = "%.ppt%->.+"
L3_1["pptm->"] = "%.pptm%->.+"
L3_1[".pps->"] = "%.pps%->.+"
L3_1["pptx->"] = "%.pptx%->.+"
L3_1["ppsx->"] = "%.ppsx%->.+"
L3_1[".odt->"] = "%.odt%->.+"
L3_1[".xml->"] = "%.xml%->.+"
L4_1 = pairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L2_1
  L11_1 = L7_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L9_1 = string
    L9_1 = L9_1.match
    L10_1 = L2_1
    L11_1 = L8_1
    L9_1 = L9_1(L10_1, L11_1)
    if L9_1 ~= nil then
      L11_1 = L9_1
      L10_1 = L9_1.len
      L10_1 = L10_1(L11_1)
      if not (L10_1 < 12) then
        goto lbl_83
      end
    end
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    do return L10_1 end
    ::lbl_83::
    L11_1 = L9_1
    L10_1 = L9_1.find
    L12_1 = "sheets/"
    L13_1 = 1
    L14_1 = true
    L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
    if L10_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
