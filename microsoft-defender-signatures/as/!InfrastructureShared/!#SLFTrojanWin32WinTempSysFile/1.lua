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
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILE_AGE
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 ~= nil and 3600 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = string
L3_1 = L3_1.sub
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_FILENAME
L4_1 = L4_1(L5_1)
L5_1 = -4
L3_1, L4_1, L5_1, L6_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if L2_1 ~= ".sys" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_FILEPATH
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = string
L4_1 = L4_1.sub
L5_1 = L2_1
L6_1 = -13
L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= "\\windows\\temp" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 == L3_1 then
  L3_1 = mp
  L3_1 = L3_1.get_contextdata
  L4_1 = mp
  L4_1 = L4_1.CONTEXT_DATA_NEWLYCREATEDHINT
  L3_1 = L3_1(L4_1)
  if not L3_1 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSNAME
L4_1, L5_1, L6_1 = L4_1(L5_1)
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 ~= "ntoskrnl.exe" then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
