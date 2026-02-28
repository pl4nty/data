local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    goto lbl_77
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_NEWLYCREATEDHINT
L1_1 = L1_1(L2_1)
if L1_1 == true then
  L1_1 = peattributes
  L1_1 = L1_1.isdll
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
  L1_1 = mp
  L1_1 = L1_1.getfilesize
  L1_1 = L1_1()
  if L1_1 < 17920 or 44288 < L1_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = MpCommon
  L3_1 = L3_1.PathToWin32Path
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_FILEPATH
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1, L6_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_FILENAME
  L4_1, L5_1, L6_1 = L4_1(L5_1)
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L3_1
  L6_1 = -4
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == ".exe" then
    L5_1 = L2_1
    L4_1 = L2_1.sub
    L6_1 = -5
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 == "\\temp" then
      L5_1 = L3_1
      L4_1 = L3_1.find
      L6_1 = "%l%l%l%l%l%.exe"
      L4_1 = L4_1(L5_1, L6_1)
      if L4_1 == 1 then
        L4_1 = mp
        L4_1 = L4_1.INFECTED
        return L4_1
      end
    end
  end
end
::lbl_77::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
