local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = ""
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "//SCRIPT:ContentTypeMacroSheet"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = "OXML"
else
  L1_1 = mp
  L1_1 = L1_1.get_mpattribute
  L2_1 = "AGGR:XlsHasMacroSheet"
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L0_1 = "OLE"
  else
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = "Lua:XL4"
L2_1 = L0_1
L1_1 = L1_1 .. L2_1
L2_1 = mp
L2_1 = L2_1.set_mpattribute
L3_1 = "//Lua:XL4MacroFile"
L2_1(L3_1)
L2_1 = ""
L3_1 = sysio
L3_1 = L3_1.RegOpenKey
L4_1 = "HKCU\\Software\\Microsoft\\Office\\16.0\\Excel"
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L2_1 = "16.0"
else
  L4_1 = sysio
  L4_1 = L4_1.RegOpenKey
  L5_1 = "HKCU\\Software\\Microsoft\\Office\\15.0\\Excel"
  L4_1 = L4_1(L5_1)
  L3_1 = L4_1
  if L3_1 ~= nil then
    L2_1 = "15.0"
  else
    L4_1 = sysio
    L4_1 = L4_1.RegOpenKey
    L5_1 = "HKCU\\Software\\Microsoft\\Office\\14.0\\Excel"
    L4_1 = L4_1(L5_1)
    L3_1 = L4_1
    if L3_1 ~= nil then
      L2_1 = "14.0"
    else
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = L1_1
      L6_1 = "MacroDisabled.Z"
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
  end
end
L4_1 = sysio
L4_1 = L4_1.RegOpenKey
L5_1 = "HKCU\\Software\\Microsoft\\Office\\"
L6_1 = L2_1
L7_1 = "\\Excel\\Security"
L5_1 = L5_1 .. L6_1 .. L7_1
L4_1 = L4_1(L5_1)
if L4_1 ~= nil then
  if L2_1 == "16.0" then
    L5_1 = sysio
    L5_1 = L5_1.GetRegValueAsDword
    L6_1 = L4_1
    L7_1 = "XL4MacroWarningFollowVBA"
    L5_1 = L5_1(L6_1, L7_1)
    if L5_1 == 0 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = L1_1
      L8_1 = "MacroDisabled.A"
      L7_1 = L7_1 .. L8_1
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = sysio
    L6_1 = L6_1.GetRegValueAsDword
    L7_1 = L4_1
    L8_1 = "XL4MacroOff"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == 1 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = L1_1
      L9_1 = "MacroDisabled.D"
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  end
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsDword
  L6_1 = L4_1
  L7_1 = "VBAWarnings"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 == 3 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = L1_1
    L8_1 = "MacroDisabled.B"
    L7_1 = L7_1 .. L8_1
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
  if L5_1 == 4 then
    L6_1 = mp
    L6_1 = L6_1.set_mpattribute
    L7_1 = L1_1
    L8_1 = "MacroDisabled.C"
    L7_1 = L7_1 .. L8_1
    L6_1(L7_1)
    L6_1 = mp
    L6_1 = L6_1.CLEAN
    return L6_1
  end
end
L5_1 = sysio
L5_1 = L5_1.RegOpenKey
L6_1 = "HKCU\\Software\\Policies\\Microsoft\\office\\"
L7_1 = L2_1
L8_1 = "\\excel\\security"
L6_1 = L6_1 .. L7_1 .. L8_1
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  if L2_1 == "16.0" then
    L6_1 = sysio
    L6_1 = L6_1.GetRegValueAsDword
    L7_1 = L5_1
    L8_1 = "XL4MacroWarningFollowVBA"
    L6_1 = L6_1(L7_1, L8_1)
    if L6_1 == 0 then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = L1_1
      L9_1 = "MacroDisabled.E"
      L8_1 = L8_1 .. L9_1
      L7_1(L8_1)
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
    L7_1 = sysio
    L7_1 = L7_1.GetRegValueAsDword
    L8_1 = L5_1
    L9_1 = "XL4MacroOff"
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 == 1 then
      L8_1 = mp
      L8_1 = L8_1.set_mpattribute
      L9_1 = L1_1
      L10_1 = "MacroDisabled.H"
      L9_1 = L9_1 .. L10_1
      L8_1(L9_1)
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
  end
  L6_1 = sysio
  L6_1 = L6_1.GetRegValueAsDword
  L7_1 = L5_1
  L8_1 = "VBAWarnings"
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 == 3 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = L1_1
    L9_1 = "MacroDisabled.F"
    L8_1 = L8_1 .. L9_1
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  if L6_1 == 4 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = L1_1
    L9_1 = "MacroDisabled.G"
    L8_1 = L8_1 .. L9_1
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = L1_1
L8_1 = "MacroEnabled.A"
L7_1 = L7_1 .. L8_1
L6_1(L7_1)
L6_1 = mp
L6_1 = L6_1.INFECTED
return L6_1
