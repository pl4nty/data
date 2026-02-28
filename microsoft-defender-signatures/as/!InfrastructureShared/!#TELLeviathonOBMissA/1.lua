local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.GetResmgrBasePlugin
L0_1 = L0_1()
if L0_1 ~= "Regkeyvalue" then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_FILEPATH
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "hklm\\software\\microsoft\\windows advanced threat protection"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = nil
  L2_1 = sysio
  L2_1 = L2_1.RegOpenKey
  L3_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows Advanced Threat Protection"
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L3_1 = sysio
    L3_1 = L3_1.GetRegValueAsString
    L4_1 = L2_1
    L5_1 = "OnboardedInfo"
    L3_1 = L3_1(L4_1, L5_1)
    L1_1 = L3_1
  end
  if L1_1 ~= nil then
    L3_1 = #L1_1
    if not (L3_1 < 10) then
      L3_1 = string
      L3_1 = L3_1.find
      L4_1 = L1_1
      L5_1 = "orgId"
      L6_1 = 1
      L7_1 = true
      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
      if L3_1 ~= false then
        goto lbl_61
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_61::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
