local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
L2_1 = L2_1.CONTEXT_DATA_PROCESS_PPID
L1_1 = L1_1(L2_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = "HSTR:Backdoor:Win64/Capybara!"
L4_1 = mp
L4_1 = L4_1.get_mpattributesubstring
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.enum_mpattributesubstring
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  L5_1 = L4_1 or L5_1
  if L4_1 then
    L5_1 = L4_1[1]
  end
  if not L5_1 then
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  L6_1 = string
  L6_1 = L6_1.sub
  L7_1 = L5_1
  L8_1 = #L3_1
  L8_1 = L8_1 + 1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == nil then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = mp
  L7_1 = L7_1.getfilename
  L8_1 = mp
  L8_1 = L8_1.bitor
  L9_1 = mp
  L9_1 = L9_1.FILEPATH_QUERY_PATH
  L10_1 = mp
  L10_1 = L10_1.FILEPATH_QUERY_LOWERCASE
  L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 == nil then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
  L8_1 = L7_1
  L9_1 = "\\"
  L10_1 = L6_1
  L2_1 = L8_1 .. L9_1 .. L10_1
  L8_1 = sysio
  L8_1 = L8_1.IsFileExists
  L9_1 = L2_1
  L8_1 = L8_1(L9_1)
  if not L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L4_1 = MpCommon
L4_1 = L4_1.BmTriggerSig
L5_1 = L1_1
L6_1 = "Backdoor:Win64/Capybara"
L7_1 = L2_1
L4_1(L5_1, L6_1, L7_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
