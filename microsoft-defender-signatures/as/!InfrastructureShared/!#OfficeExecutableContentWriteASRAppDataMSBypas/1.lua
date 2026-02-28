local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.IsHipsRuleEnabled
L1_1 = "1d9fb1e9-5186-49a5-92bd-86a3db551b47"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_CONTENTNAME
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L2_1 = sysio
  L2_1 = L2_1.IsFileExists
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.ContextualExpandEnvironmentVariables
    L3_1 = "%appdata%"
    L2_1 = L2_1(L3_1)
    if L2_1 == nil then
      L3_1 = ""
      if L3_1 then
        goto lbl_34
      end
    end
    L3_1 = L2_1
    ::lbl_34::
    L4_1 = L3_1
    L3_1 = L3_1.lower
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L1_1
    L3_1 = L1_1.find
    L5_1 = L2_1
    L6_1 = "\\microsoft\\"
    L5_1 = L5_1 .. L6_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 ~= nil then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = mp
    L3_1 = L3_1.ContextualExpandEnvironmentVariables
    L4_1 = "%localappdata%"
    L3_1 = L3_1(L4_1)
    if L3_1 == nil then
      L4_1 = ""
      if L4_1 then
        goto lbl_59
      end
    end
    L4_1 = L3_1
    ::lbl_59::
    L5_1 = L4_1
    L4_1 = L4_1.lower
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    L5_1 = L1_1
    L4_1 = L1_1.find
    L6_1 = L3_1
    L7_1 = "\\microsoft\\"
    L6_1 = L6_1 .. L7_1
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 ~= nil then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.SetHipsRule
    L5_1 = "1d9fb1e9-5186-49a5-92bd-86a3db551b47"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.BLOCKEXECUTION
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
