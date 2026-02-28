local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 == nil or L0_1 == "" then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "tsv_to_xlsx.exe"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if not L1_1 then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "pypdf2docx.exe"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if not L1_1 then
    goto lbl_39
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_39::
L1_1 = {}
L1_1[".doc.exe"] = ""
L1_1["docx.exe"] = ""
L1_1["docm.exe"] = ""
L1_1[".xls.exe"] = ""
L1_1["xlsx.exe"] = ""
L1_1[".ppt.exe"] = ""
L1_1["pptx.exe"] = ""
L1_1[".rtf.exe"] = ""
L1_1[".pdf.exe"] = ""
L1_1[".txt.exe"] = ""
L1_1[".rar.exe"] = ""
L1_1[".zip.exe"] = ""
L1_1["    .exe"] = ""
L1_1["____.exe"] = ""
L1_1["rar.exe"] = ""
L1_1["doc.exe"] = ""
L1_1["xls.exe"] = ""
L1_1["pdf.exe"] = ""
L1_1["txt.exe"] = ""
L1_1["zip.exe"] = ""
L1_1[".docx.js"] = ""
L1_1[".xlsx.js"] = ""
L1_1[".pptx.js"] = ""
L1_1[".doc.js"] = ""
L1_1[".ppt.js"] = ""
L1_1[".xls.js"] = ""
L1_1[".pdf.js"] = ""
L1_1[".txt.js"] = ""
L3_1 = L0_1
L2_1 = L0_1.sub
L4_1 = -8
L2_1 = L2_1(L3_1, L4_1)
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = -7
L3_1 = L3_1(L4_1, L5_1)
L4_1 = L1_1[L3_1]
if L4_1 == nil then
  L4_1 = L1_1[L2_1]
  if L4_1 == nil then
    goto lbl_83
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
do return L4_1 end
::lbl_83::
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
