local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4194304 < L0_1 then
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
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1 = L2_1(L3_1, L4_1)
L1_1, L2_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1)
if L1_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L1_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 25) then
    goto lbl_35
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_35::
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.len
  L4_1 = L2_1
  L3_1 = L3_1(L4_1)
  if not (L3_1 < 15) then
    goto lbl_46
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_46::
L4_1 = L2_1
L3_1 = L2_1.sub
L5_1 = -4
L3_1 = L3_1(L4_1, L5_1)
L5_1 = L2_1
L4_1 = L2_1.sub
L6_1 = -3
L4_1 = L4_1(L5_1, L6_1)
L5_1 = {}
L5_1[".jse"] = true
L5_1[".vbs"] = true
L5_1[".wsf"] = true
L5_1[".vbe"] = true
L5_1[".hta"] = true
L5_1[".mht"] = true
L5_1[".bat"] = true
L5_1[".ps1"] = true
L5_1[".cmd"] = true
L5_1[".url"] = true
L5_1[".jar"] = true
L5_1[".lnk"] = true
L5_1[".exe"] = true
L5_1[".scr"] = true
L5_1[".pif"] = true
L5_1[".docx"] = true
L5_1[".xlsx"] = true
L5_1[".doc"] = true
L5_1[".xls"] = true
L5_1[".rtf"] = true
L5_1.docm = true
L5_1.xlsm = true
L5_1.ppam = true
L5_1.pptm = true
L5_1.ppsm = true
L5_1.potm = true
L5_1[".js"] = true
L6_1 = L5_1[L3_1]
if L6_1 ~= true then
  L6_1 = L5_1[L4_1]
  if L6_1 ~= true then
    goto lbl_168
  end
end
L6_1 = {}
L6_1[".zip)->"] = "%.zip%)%->.+"
L6_1[".rar)->"] = "%.rar%)%->.+"
L6_1[".7z)->"] = "%.7z%)%->.+"
L6_1[".iso)->"] = "%.iso%)%->.+"
L6_1[".arj)->"] = "%.arj%)%->.+"
L6_1[".gz)->"] = "%.gz%)%->.+"
L6_1[".ace)->"] = "%.ace%)%->.+"
L6_1[".z)->"] = "%.z%)%->.+"
L6_1[".xz)->"] = "%.xz%)%->.+"
L6_1[".bz)->"] = "%.bz%)%->.+"
L6_1[".rev)->"] = "%.rev%)%->.+"
L6_1[".r00)->"] = "%.r00%)%->.+"
L7_1 = pairs
L8_1 = L6_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = string
  L12_1 = L12_1.find
  L13_1 = L2_1
  L14_1 = L10_1
  L15_1 = 1
  L16_1 = true
  L12_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  if L12_1 then
    L12_1 = string
    L12_1 = L12_1.match
    L13_1 = L2_1
    L14_1 = L11_1
    L12_1 = L12_1(L13_1, L14_1)
    if L12_1 ~= nil then
      L14_1 = L12_1
      L13_1 = L12_1.len
      L13_1 = L13_1(L14_1)
      if not (L13_1 < 12) then
        goto lbl_126
      end
    end
    L13_1 = mp
    L13_1 = L13_1.CLEAN
    do return L13_1 end
    ::lbl_126::
    L14_1 = L10_1
    L13_1 = L10_1.len
    L13_1 = L13_1(L14_1)
    L13_1 = L13_1 + 1
    L14_1 = L13_1 + 5
    L16_1 = L12_1
    L15_1 = L12_1.len
    L15_1 = L15_1(L16_1)
    if L14_1 >= L15_1 then
      L14_1 = mp
      L14_1 = L14_1.CLEAN
      return L14_1
    end
    L14_1 = string
    L14_1 = L14_1.sub
    L15_1 = L12_1
    L16_1 = L13_1
    L17_1 = -5
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    if L14_1 == nil then
      L15_1 = mp
      L15_1 = L15_1.CLEAN
      return L15_1
    end
    L15_1 = L14_1
    L16_1 = L10_1
    L15_1 = L15_1 .. L16_1
    L16_1 = string
    L16_1 = L16_1.find
    L17_1 = L2_1
    L18_1 = L15_1
    L19_1 = 1
    L20_1 = true
    L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
    if L16_1 == nil then
      L16_1 = mp
      L16_1 = L16_1.CLEAN
      return L16_1
    end
    L16_1 = mp
    L16_1 = L16_1.INFECTED
    return L16_1
  end
end
::lbl_168::
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
