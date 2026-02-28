local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_FILENAME
  L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
  L2_1 = {}
  L2_1[".doc"] = ""
  L2_1[".xls"] = ""
  L2_1[".ppt"] = ""
  L2_1[".pdf"] = ""
  L2_1[".jpg"] = ""
  L2_1[".gif"] = ""
  L2_1[".png"] = ""
  L2_1[".pic"] = ""
  L2_1[".txt"] = ""
  L2_1[".mp3"] = ""
  L3_1 = {}
  L3_1[".docx"] = ""
  L3_1[".xlsx"] = ""
  L3_1[".pptx"] = ""
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = -4
  L4_1 = L4_1(L5_1, L6_1)
  L4_1 = L2_1[L4_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = -5
  L4_1 = L4_1(L5_1, L6_1)
  L4_1 = L3_1[L4_1]
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
