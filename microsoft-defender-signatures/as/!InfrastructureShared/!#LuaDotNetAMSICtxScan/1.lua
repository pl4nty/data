-- Threat: !InfrastructureShared
-- Name: !#Lua:DotNetAMSICtxScan
-- Type: 12
-- Includes: BMLuaLib
-- MpAttributes: MpAmsiRtpScan

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if not (l_0_0 and l_0_1) or l_0_1 ~= "DotNet" and l_0_1 ~= "coreclr" then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:IsDotNetAMSIScan")
local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = sysio.GetFileNameFromProcess(l_0_3)
if not sysio.GetLastResult().Success or not l_0_4 then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_NoProcess")
  return mp.CLEAN
end
local l_0_5 = false
l_0_4 = string.lower(l_0_4)
if 15 <= #l_0_4 and l_0_4:sub(-15) == "\\powershell.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_PowerShell")
elseif 12 <= #l_0_4 and (l_0_4:sub(-12) == "\\wscript.exe" or l_0_4:sub(-12) == "\\cscript.exe") then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_WScript")
elseif 17 <= #l_0_4 and l_0_4:sub(-17) == "\\inetsrv\\w3wp.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_IIS")
  local l_0_6 = mp.GetProcessCommandLine(l_0_3)
  if string.find(l_0_6, "-ap \"MSExchange", 1, true) or string.find(l_0_6, "-ap \"MSUccPowerShellAppPool", 1, true) or string.find(l_0_6, "-ap \"MSUccPswsFrontEndAppPool", 1, true) or string.find(l_0_6, "-ap \"MSUccPowerShellLiveIdAppPool", 1, true) then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_Exchg")
  elseif string.find(l_0_6, "-ap \"", 1, true) == nil and IsExchangeServer() ~= nil then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_ExchgPlatform")
  elseif string.find(l_0_6, "-ap \"SharePoint", 1, true) or string.find(l_0_6, "-ap \"SecurityTokenServiceApplicationPool", 1, true) or string.find(l_0_6, "-ap \"ODSPNotificationListeningEndpoint", 1, true) or string.find(l_0_6, "-ap \"GridManagerAppPool", 1, true) or string.find(l_0_6, "-ap \"Grid SharePoint", 1, true) then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_SharePoint")
  elseif IsSharepointServer() ~= nil then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_SPPlatform")
  end
elseif 18 <= #l_0_4 and l_0_4:sub(-18) == "\\runtimebroker.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_RuntimeBroker")
elseif 13 <= #l_0_4 and l_0_4:sub(-13) == "\\sqlservr.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_SQLServer")
elseif 41 <= #l_0_4 and l_0_4:sub(-41) == "\\microsoft.identityserver.servicehost.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_ADFSServce")
elseif 13 <= #l_0_4 and l_0_4:sub(-13) == "\\rundll32.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_Rundll32")
elseif 8 <= #l_0_4 and l_0_4:sub(-8) == "\\mmc.exe" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_MMC")
end
if 9 <= #l_0_4 and l_0_4:sub(2, 9) == ":\\users\\" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_Users")
  l_0_5 = true
elseif 15 <= #l_0_4 and l_0_4:sub(2, 15) == ":\\programdata\\" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_ProgramData")
  l_0_5 = true
elseif 11 <= #l_0_4 and l_0_4:sub(2, 11) == ":\\windows\\" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_Windir")
  if 20 <= #l_0_4 and (l_0_4:sub(11, 20) == "\\system32\\" or l_0_4:sub(11, 20) == "\\syswow64\\") then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_System")
  elseif 25 <= #l_0_4 and l_0_4:sub(11, 25) == "\\microsoft.net\\" then
    mp.set_mpattribute("Lua:IsDotNetAMSIScan_Framework")
  end
elseif 17 <= #l_0_4 and l_0_4:sub(2, 17) == ":\\program files\\" or 23 <= #l_0_4 and l_0_4:sub(2, 23) == ":\\program files (x86)\\" then
  mp.set_mpattribute("Lua:IsDotNetAMSIScan_ProgramFiles")
else
  l_0_5 = true
end
if l_0_5 and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
  mp.ReportLowfi(l_0_4, 2670337877)
end
return mp.CLEAN
