local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
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
    goto lbl_72
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
  if 17664 < L1_1 and L1_1 < 26112 or 32768 < L1_1 and L1_1 < 44288 then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = mp
    L3_1 = L3_1.get_contextdata
    L4_1 = mp
    L4_1 = L4_1.CONTEXT_DATA_FILENAME
    L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1)
    L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
    L3_1 = string
    L3_1 = L3_1.sub
    L4_1 = L2_1
    L5_1 = -4
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= ".zip" then
      L5_1 = L2_1
      L4_1 = L2_1.find
      L6_1 = ".7z"
      L7_1 = 1
      L8_1 = true
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
      if L4_1 == nil and L3_1 ~= ".rar" and L3_1 ~= ".exe" and L3_1 ~= ".pif" and L3_1 ~= ".scr" then
        goto lbl_72
      end
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
::lbl_72::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
