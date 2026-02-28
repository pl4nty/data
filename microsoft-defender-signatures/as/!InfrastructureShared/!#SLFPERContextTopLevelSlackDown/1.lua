local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 400 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
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
  L3_1 = L3_1.CONTEXT_DATA_FILEPATH
  L2_1, L3_1, L4_1, L5_1, L6_1 = L2_1(L3_1)
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1)
  L3_1 = L1_1
  L2_1 = L1_1.find
  L4_1 = "\\downloads"
  L5_1 = 1
  L6_1 = true
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  if L2_1 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_FILENAME
    L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = -4
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 == ".mp3" or L3_1 == ".mp4" or L3_1 == ".jpg" or L3_1 == ".mov" then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
    L5_1, L6_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == "slack.exe" then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
