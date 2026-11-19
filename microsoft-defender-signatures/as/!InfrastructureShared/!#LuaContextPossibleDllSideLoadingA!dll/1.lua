-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/PossibleDllSideLoading.A!dll
-- Type: 8
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1 == nil or #l_0_1 < 4 then
  return mp.CLEAN
end
local l_0_2 = {
  ["version.dll"] = ":\\windows\\system32",
  ["activeds.dll"] = ":\\windows\\system32",
  ["credui.dll"] = ":\\windows\\system32",
  ["dpx.dll"] = ":\\windows\\system32",
  ["dui70.dll"] = ":\\windows\\system32",
  ["duser.dll"] = ":\\windows\\system32",
  ["dwmapi.dll"] = ":\\windows\\system32",
  ["dxgi.dll"] = ":\\windows\\system32",
  ["fvewiz.dll"] = ":\\windows\\system32",
  ["mfc42u.dll"] = ":\\windows\\system32",
  ["oleacc.dll"] = ":\\windows\\system32",
  ["secur32.dll"] = ":\\windows\\system32",
  ["slc.dll"] = ":\\windows\\system32",
  ["spp.dll"] = ":\\windows\\system32",
  ["tapi32.dll"] = ":\\windows\\system32",
  ["uxtheme.dll"] = ":\\windows\\system32",
  ["wer.dll"] = ":\\windows\\system32",
  ["winbrand.dll"] = ":\\windows\\system32",
  ["winmm.dll"] = ":\\windows\\system32",
  ["winsta.dll"] = ":\\windows\\system32",
  ["wtsapi32.dll"] = ":\\windows\\system32",
  ["xmllite.dll"] = ":\\windows\\system32"
}
local l_0_3 = l_0_2[l_0_1]
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_4 == nil or #l_0_4 < 1 then
  return mp.CLEAN
end
if l_0_4:sub(1, 8) == "\\device\\" then
  l_0_4 = MpCommon.PathToWin32Path(l_0_4)
  if l_0_4 == nil then
    return mp.CLEAN
  end
  l_0_4 = string.lower(l_0_4)
end
if l_0_4:sub(1, 4) == "\\\\?\\" then
  l_0_4 = l_0_4:sub(5)
end
if string.sub(l_0_4, 2) == l_0_3 then
  return mp.CLEAN
end
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
if l_0_5 == nil or #l_0_5 == 0 then
  return mp.CLEAN
end
local l_0_6 = l_0_4 .. "\\" .. l_0_5
if MpCommon.QueryPersistContext(l_0_6, "CheckPossibleDllSideLoadingA") then
  local l_0_7 = "Lua:Context/PossibleDllSideLoading.A!" .. l_0_1
  mp.set_mpattribute(l_0_7)
  return mp.INFECTED
elseif mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_8 = l_0_4 .. "\\" .. l_0_1
  if mp.IsKnownFriendlyFile(l_0_8, false, false) == true or mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  mp.set_mpattribute("MpDisableCaching")
end
return mp.CLEAN
