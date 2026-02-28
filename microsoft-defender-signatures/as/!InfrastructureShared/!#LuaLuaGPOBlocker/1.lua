local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L2_1 = L0_1
L1_1 = L0_1.lower
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.find
L4_1 = "svchost"
L5_1 = 1
L6_1 = true
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.lower
L3_1 = L3_1(L4_1)
L4_1 = "^\\device\\mup\\.+\\sysvol\\.+\\policies\\{(%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x)}\\gpt.ini$"
L6_1 = L3_1
L5_1 = L3_1.match
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = tostring
L7_1 = headerpage
L6_1 = L6_1(L7_1)
if not L6_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "Version%s*=%s*(%d+)"
L7_1 = L7_1(L8_1, L9_1)
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:GptIniMissingVersion"
  L8_1(L9_1)
  L8_1 = mp
  L8_1 = L8_1.INFECTED
  return L8_1
end
L8_1 = pcall
L9_1 = MpCommon
L9_1 = L9_1.RollingQueueQueryKey
L10_1 = "gpo_block"
L11_1 = L5_1
L8_1, L9_1 = L8_1(L9_1, L10_1, L11_1)
if L8_1 and L9_1 then
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L10_1 = pcall
L11_1 = MpCommon
L11_1 = L11_1.RollingQueueQueryKey
L12_1 = "gpo_applied"
L13_1 = L5_1
L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
if L10_1 and L11_1 then
  L12_1 = L11_1.value
  if L12_1 then
    L12_1 = L11_1.value
    if L12_1 == L7_1 then
      L12_1 = mp
      L12_1 = L12_1.CLEAN
      return L12_1
    end
  end
end
L12_1 = tonumber
L13_1 = L7_1
L12_1 = L12_1(L13_1)
L13_1 = mp
L13_1 = L13_1.set_mpattributeex
L14_1 = "Lua:GPOVersion"
L15_1 = L12_1
L13_1(L14_1, L15_1)
L13_1 = mp
L13_1 = L13_1.set_mpattribute
L14_1 = "Lua:GPOBlockerFilter"
L13_1(L14_1)
L13_1 = mp
L13_1 = L13_1.CLEAN
return L13_1
