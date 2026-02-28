local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 < 22) then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\appdata\\local\\temp\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 ~= nil then
      goto lbl_29
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_29::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILENAME
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.len
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if not (L2_1 < 5) then
    goto lbl_48
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_48::
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L1_1
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 4) then
    goto lbl_64
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_64::
L3_1 = {}
L3_1[".xls"] = "excel"
L3_1.xlsx = "excel"
L3_1.xlsm = "excel"
L3_1.xlsb = "excel"
L3_1.xltx = "excel"
L3_1.xltm = "excel"
L3_1[".xlt"] = "excel"
L3_1.xlam = "excel"
L3_1[".xla"] = "excel"
L3_1[".doc"] = "word"
L3_1.docx = "word"
L3_1.docm = "word"
L3_1.dotx = "word"
L3_1.dotm = "word"
L3_1[".rtf"] = "word"
L3_1[".ppt"] = "powerpoint"
L3_1.pptm = "powerpoint"
L3_1[".pps"] = "powerpoint"
L3_1.pptx = "powerpoint"
L3_1.ppsx = "powerpoint"
L3_1[".odt"] = "odt"
L3_1[".xml"] = "xml"
L4_1 = L3_1[L2_1]
if L4_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.match
L5_1 = L0_1
L6_1 = "\\appdata\\local\\temp\\(.+)"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not (L5_1 < 4) then
    goto lbl_109
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_109::
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = {}
L5_1.zip = "temp%x_.+%.zip"
L5_1.rar = "rar$.+"
L5_1["7zip"] = "7z.+"
L5_1.wzip = "wz.+"
L6_1 = L3_1[L2_1]
L7_1 = pairs
L8_1 = L5_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = string
  L12_1 = L12_1.match
  L13_1 = L4_1
  L14_1 = L11_1
  L12_1 = L12_1(L13_1, L14_1)
  if L12_1 ~= nil then
    L12_1 = mp
    L12_1 = L12_1.set_mpattribute
    L13_1 = "Lua:OfficeExtractedFileInZip.A!"
    L14_1 = L10_1
    L15_1 = "_"
    L16_1 = L6_1
    L13_1 = L13_1 .. L14_1 .. L15_1 .. L16_1
    L12_1(L13_1)
    L12_1 = mp
    L12_1 = L12_1.INFECTED
    return L12_1
  end
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
