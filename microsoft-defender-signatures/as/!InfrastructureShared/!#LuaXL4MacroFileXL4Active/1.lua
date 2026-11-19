-- Threat: !InfrastructureShared
-- Name: !#Lua:XL4MacroFileXL4Active
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & MpNewlyCreatedHint & (//SCRIPT:ContentTypeMacroSheet | AGGR:XlsHasMacroSheet) & !//Lua:XL4MacroFile

local l_0_0 = ""
if mp.get_mpattribute("//SCRIPT:ContentTypeMacroSheet") then
  l_0_0 = "OXML"
elseif mp.get_mpattribute("AGGR:XlsHasMacroSheet") then
  l_0_0 = "OLE"
else
  return mp.CLEAN
end
local l_0_1 = "Lua:XL4" .. l_0_0
mp.set_mpattribute("//Lua:XL4MacroFile")
local l_0_2 = ""
local l_0_3 = sysio.RegOpenKey("HKCU\\Software\\Microsoft\\Office\\16.0\\Excel")
if l_0_3 ~= nil then
  l_0_2 = "16.0"
else
  l_0_3 = sysio.RegOpenKey("HKCU\\Software\\Microsoft\\Office\\15.0\\Excel")
  if l_0_3 ~= nil then
    l_0_2 = "15.0"
  else
    l_0_3 = sysio.RegOpenKey("HKCU\\Software\\Microsoft\\Office\\14.0\\Excel")
    if l_0_3 ~= nil then
      l_0_2 = "14.0"
    else
      mp.set_mpattribute(l_0_1 .. "MacroDisabled.Z")
      return mp.CLEAN
    end
  end
end
local l_0_4 = sysio.RegOpenKey("HKCU\\Software\\Microsoft\\Office\\" .. l_0_2 .. "\\Excel\\Security")
if l_0_4 ~= nil then
  if l_0_2 == "16.0" then
    local l_0_5 = sysio.GetRegValueAsDword(l_0_4, "XL4MacroWarningFollowVBA")
    if l_0_5 == 0 then
      mp.set_mpattribute(l_0_1 .. "MacroDisabled.A")
      return mp.CLEAN
    end
    local l_0_6 = sysio.GetRegValueAsDword(l_0_4, "XL4MacroOff")
    if l_0_6 == 1 then
      mp.set_mpattribute(l_0_1 .. "MacroDisabled.D")
      return mp.CLEAN
    end
  end
  local l_0_7 = sysio.GetRegValueAsDword(l_0_4, "VBAWarnings")
  if l_0_7 == 3 then
    mp.set_mpattribute(l_0_1 .. "MacroDisabled.B")
    return mp.CLEAN
  end
  if l_0_7 == 4 then
    mp.set_mpattribute(l_0_1 .. "MacroDisabled.C")
    return mp.CLEAN
  end
end
local l_0_8 = sysio.RegOpenKey("HKCU\\Software\\Policies\\Microsoft\\office\\" .. l_0_2 .. "\\excel\\security")
if l_0_8 ~= nil then
  if l_0_2 == "16.0" then
    local l_0_9 = sysio.GetRegValueAsDword(l_0_8, "XL4MacroWarningFollowVBA")
    if l_0_9 == 0 then
      mp.set_mpattribute(l_0_1 .. "MacroDisabled.E")
      return mp.CLEAN
    end
    local l_0_10 = sysio.GetRegValueAsDword(l_0_8, "XL4MacroOff")
    if l_0_10 == 1 then
      mp.set_mpattribute(l_0_1 .. "MacroDisabled.H")
      return mp.CLEAN
    end
  end
  local l_0_11 = sysio.GetRegValueAsDword(l_0_8, "VBAWarnings")
  if l_0_11 == 3 then
    mp.set_mpattribute(l_0_1 .. "MacroDisabled.F")
    return mp.CLEAN
  end
  if l_0_11 == 4 then
    mp.set_mpattribute(l_0_1 .. "MacroDisabled.G")
    return mp.CLEAN
  end
end
mp.set_mpattribute(l_0_1 .. "MacroEnabled.A")
return mp.INFECTED
