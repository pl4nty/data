-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/TrackCreateWebShell.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:ASPExt | Lua:ASPXExt | Lua:ASHXExt)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = MpCommon.PathToWin32Path(l_0_2)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_3 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if string.find(l_0_2, l_0_4 .. "clientaccess\\oab\\temp\\", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_1 == "asrtestfile-a8f5898e-1dc8-49a9-9878-85004b8a61e6.asp" then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
else
  local l_0_5 = MpCommon.ExpandEnvironmentVariables("%SystemDrive%\\inetpub\\wwwroot")
  if l_0_5 == nil or l_0_5 == "" then
    return mp.CLEAN
  end
  local l_0_6 = string.lower(l_0_5)
  if string.find(l_0_2, l_0_6, 1, true) then
    mp.set_mpattribute("MpDisableCaching")
    return mp.INFECTED
  end
  local l_0_7 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  local l_0_8 = MpCommon.GetIisInstallPaths(l_0_7)
  if next(l_0_8) == nil then
    return mp.CLEAN
  end
  for l_0_9, l_0_10 in ipairs(l_0_8) do
    if l_0_10.Path ~= nil and l_0_10.Path ~= "" and string.find(l_0_2, string.lower(l_0_10.Path), 1, true) then
      mp.set_mpattribute("MpDisableCaching")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
