-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanWin32TrackCreateWeb\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = (string.match)(l_0_1, "(%.[^%.]+)$")
if l_0_2 ~= ".asp" and l_0_2 ~= ".aspx" and l_0_2 ~= ".ashx" then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
local l_0_4 = (MpCommon.ExpandEnvironmentVariables)("%ExchangeInstallPath%")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if not (sysio.IsFileExists)(l_0_4 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
  return mp.CLEAN
end
local l_0_5 = (string.lower)(l_0_4)
if (string.find)(l_0_3, l_0_5 .. "clientaccess\\oab\\temp\\", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_1 == "asrtestfile-a8f5898e-1dc8-49a9-9878-85004b8a61e6.asp" then
  (mp.set_mpattribute)("MpDisableCaching")
  return mp.INFECTED
else
  local l_0_6 = (MpCommon.ExpandEnvironmentVariables)("%SystemDrive%\\inetpub\\wwwroot")
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
  local l_0_7 = (string.lower)(l_0_6)
  if (string.find)(l_0_3, l_0_7, 1, true) then
    (mp.set_mpattribute)("MpDisableCaching")
    return mp.INFECTED
  end
  local l_0_8 = (MpCommon.ExpandEnvironmentVariables)("%windir%\\system32\\inetsrv\\config\\applicationHost.config")
  if l_0_8 == nil or l_0_8 == "" then
    return mp.CLEAN
  end
  local l_0_9 = (MpCommon.GetIisInstallPaths)(l_0_8)
  if next(l_0_9) == nil then
    return mp.CLEAN
  end
  for l_0_13,l_0_14 in ipairs(l_0_9) do
    if l_0_14.Path ~= nil and l_0_14.Path ~= "" and (string.find)(l_0_3, (string.lower)(l_0_14.Path), 1, true) then
      (mp.set_mpattribute)("MpDisableCaching")
      return mp.INFECTED
    end
  end
end
do
  l_0_6 = mp
  l_0_6 = l_0_6.CLEAN
  return l_0_6
end

