-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/TrackCreateWebShell.C
-- Type: 32
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
if l_0_1 == nil then
  return mp.CLEAN
end
if type(l_0_1) ~= "number" then
  return mp.CLEAN
end
if 60 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3 = string.match(l_0_2, "(%.[^%.]+)$")
if l_0_3 ~= ".asp" and l_0_3 ~= ".aspx" and l_0_3 ~= ".ashx" then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = MpCommon.PathToWin32Path(l_0_4)
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
l_0_4 = string.lower(l_0_4)
local l_0_5 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_5 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5)
if string.find(l_0_4, l_0_6 .. "clientaccess\\oab\\temp\\", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_2 == "asrtestfile-a8f5898e-1dc8-49a9-9878-85004b8a61e6.asp" then
  mp.set_mpattribute("MpDisableCaching")
  return mp.INFECTED
else
  local l_0_7 = MpCommon.ExpandEnvironmentVariables("%SystemDrive%\\inetpub\\wwwroot")
  if l_0_7 == nil or l_0_7 == "" then
    return mp.CLEAN
  end
  local l_0_8 = string.lower(l_0_7)
  if string.find(l_0_4, l_0_8, 1, true) then
    mp.set_mpattribute("MpDisableCaching")
    return mp.INFECTED
  end
  local l_0_9 = MpCommon.ExpandEnvironmentVariables("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
  if l_0_9 == nil or l_0_9 == "" then
    return mp.CLEAN
  end
  local l_0_10 = MpCommon.GetIisInstallPaths(l_0_9)
  if next(l_0_10) == nil then
    return mp.CLEAN
  end
  for l_0_11, l_0_12 in ipairs(l_0_10) do
    if l_0_12.Path ~= nil and l_0_12.Path ~= "" and string.find(l_0_4, string.lower(l_0_12.Path), 1, true) then
      mp.set_mpattribute("MpDisableCaching")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
