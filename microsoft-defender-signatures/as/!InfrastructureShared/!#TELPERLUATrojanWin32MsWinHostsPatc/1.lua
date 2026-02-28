local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 4096 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L2_1()
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L2_1 = string
L2_1 = L2_1.find
L3_1 = L1_1
L4_1 = "\\system32(\\%l+\\%l+\\%l+%.dat)$"
L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.len
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 ~= 18 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.get_contextdata
L6_1 = mp
L6_1 = L6_1.CONTEXT_DATA_SCANREASON
L5_1 = L5_1(L6_1)
L6_1 = mp
L6_1 = L6_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L5_1 == L6_1 then
  L5_1 = mp
  L5_1 = L5_1.get_contextdata
  L6_1 = mp
  L6_1 = L6_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L5_1 = L5_1(L6_1)
  if L5_1 == true then
    L5_1 = string
    L5_1 = L5_1.lower
    L6_1 = mp
    L6_1 = L6_1.get_contextdata
    L7_1 = mp
    L7_1 = L7_1.CONTEXT_DATA_PROCESSNAME
    L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1)
    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = mp
    L7_1 = L7_1.get_contextdata
    L8_1 = mp
    L8_1 = L8_1.CONTEXT_DATA_PROCESSDEVICEPATH
    L7_1, L8_1, L9_1, L10_1 = L7_1(L8_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
    if L5_1 ~= nil and L6_1 ~= nil then
      L7_1 = mp
      L7_1 = L7_1.ReportLowfi
      L8_1 = MpCommon
      L8_1 = L8_1.PathToWin32Path
      L9_1 = L6_1
      L8_1 = L8_1(L9_1)
      L9_1 = "\\"
      L10_1 = L5_1
      L8_1 = L8_1 .. L9_1 .. L10_1
      L9_1 = 279611152
      L7_1(L8_1, L9_1)
    end
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
