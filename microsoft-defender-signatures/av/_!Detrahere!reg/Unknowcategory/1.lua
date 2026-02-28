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
L3_1 = "hklm\\system\\currentcontrolset\\control\\network"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= nil then
  L1_1 = nil
  L2_1 = nil
  L3_1 = nil
  L4_1 = sysio
  L4_1 = L4_1.RegOpenKey
  L5_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Control\\Network"
  L4_1 = L4_1(L5_1)
  if L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.GetRegValueAsString
    L6_1 = L4_1
    L7_1 = "atimode"
    L5_1 = L5_1(L6_1, L7_1)
    L2_1 = L5_1
    L5_1 = sysio
    L5_1 = L5_1.GetRegValueAsString
    L6_1 = L4_1
    L7_1 = "set_pt"
    L5_1 = L5_1(L6_1, L7_1)
    L1_1 = L5_1
    L5_1 = sysio
    L5_1 = L5_1.GetRegValueAsString
    L6_1 = L4_1
    L7_1 = "set_hp"
    L5_1 = L5_1(L6_1, L7_1)
    L3_1 = L5_1
  end
  if L2_1 ~= nil then
    L6_1 = L2_1
    L5_1 = L2_1.len
    L5_1 = L5_1(L6_1)
    if 16 < L5_1 then
      goto lbl_74
    end
  end
  if L1_1 ~= nil then
    L6_1 = L1_1
    L5_1 = L1_1.len
    L5_1 = L5_1(L6_1)
    if 16 < L5_1 then
      goto lbl_74
    end
  end
  if L3_1 ~= nil then
    L6_1 = L3_1
    L5_1 = L3_1.len
    L5_1 = L5_1(L6_1)
    ::lbl_74::
    if 16 < L5_1 then
      L5_1 = mp
      L5_1 = L5_1.INFECTED
      return L5_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
