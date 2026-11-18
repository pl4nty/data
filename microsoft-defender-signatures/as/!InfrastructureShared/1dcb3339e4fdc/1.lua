-- Threat: !InfrastructureShared
-- Name: 1dcb3339e4fdc
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.command_line) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
l_0_2 = string.lower(l_0_2)
local l_0_3
if string.find(l_0_2, "\\powershell.exe", 1, true) then
  l_0_3 = "powershell"
elseif string.find(l_0_2, "\\pwsh.exe", 1, true) then
  l_0_3 = "pwsh"
else
  return mp.CLEAN
end
local l_0_4
if string.find(l_0_1, "invoke-command", 1, true) then
  l_0_4 = "invoke-command"
elseif string.find(l_0_1, "new-pssession", 1, true) then
  l_0_4 = "new-pssession"
elseif string.find(l_0_1, "enter-pssession", 1, true) then
  l_0_4 = "enter-pssession"
else
  return mp.CLEAN
end
if not string.find(l_0_1, "-computername", 1, true) and not string.find(l_0_1, "-cn ", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_1, "-computername localhost", 1, true) or string.find(l_0_1, "-computername .", 1, true) or string.find(l_0_1, "-computername 127.0.0.1", 1, true) or string.find(l_0_1, "-computername $env:computername", 1, true) then
  return mp.CLEAN
end
local l_0_5 = {
  "\\desiredstateconfiguration\\",
  "\\dsc\\",
  "azureautomation",
  "\\monitoringagent\\",
  "\\microsoftmonitoringagent\\",
  "\\azuremonitoragent\\",
  "\\ccmexec\\",
  "\\ccm\\scriptstore\\",
  "\\intunemanagementextension\\",
  "\\ansible\\",
  "\\winrs\\",
  "winrm.vbs"
}
for l_0_6, l_0_7 in ipairs(l_0_5) do
  if string.find(l_0_1, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
local l_0_8 = ""
if string.find(l_0_1, "-credential", 1, true) then
  l_0_8 = "remote_exec_with_credential"
elseif string.find(l_0_1, "-authentication credssp", 1, true) then
  l_0_8 = "remote_exec_credssp"
elseif string.find(l_0_1, "-authentication basic", 1, true) then
  l_0_8 = "remote_exec_basic_auth"
elseif string.find(l_0_1, "-usessl", 1, true) and (string.find(l_0_1, "-skipcacheck", 1, true) or string.find(l_0_1, "-skipcncheck", 1, true) or string.find(l_0_1, "-skiprevocationcheck", 1, true)) then
  l_0_8 = "remote_exec_ssl_cert_bypass"
elseif string.find(l_0_1, "convertto-securestring", 1, true) and string.find(l_0_1, "-asplaintext", 1, true) then
  l_0_8 = "remote_exec_plaintext_secret"
elseif string.find(l_0_1, "frombase64string", 1, true) and string.find(l_0_1, "pscredential", 1, true) then
  l_0_8 = "remote_exec_base64_credential"
end
if isnull(l_0_8) then
  return mp.CLEAN
end
WinRMSessionTrackProcess("BM", nil, "Client")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMSessionProcess.A")
mp.set_mpattribute("Lua:ContextDataProcess/WinRMClientProcess.A")
bm.add_related_string("WinRMLM_reason", l_0_8, bm.RelatedStringBMReport)
bm.add_related_string("WinRMLM_cmdlet", l_0_4, bm.RelatedStringBMReport)
bm.add_related_string("WinRMLM_host", l_0_3, bm.RelatedStringBMReport)
bm.add_related_string("WinRMLM_cmd", l_0_1, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1021.006", "WinRMLateralMove")
add_parents()
return mp.INFECTED
