-- Threat: !InfrastructureShared
-- Name: 2729b4480db2
-- Type: 21

if not mp.get_mpattribute("MpIsPowerShellAMSIScan") and not mp.get_mpattribute("MpIsRunDialogAmsiScan") then
  return mp.CLEAN
end
if mp.get_mpattribute("SCRIPT:SuspClickfix.A") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if 512 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetBruteMatchData()
local l_0_2 = ""
if l_0_1.is_header then
  l_0_2 = tostring(headerpage)
else
  l_0_2 = tostring(footerpage)
end
l_0_2 = string.lower(l_0_2)
l_0_2 = string.gsub(l_0_2, "%z", "")
l_0_2 = string.gsub(l_0_2, " ", "")
l_0_2 = string.gsub(l_0_2, "'%+'", "")
l_0_2 = string.gsub(l_0_2, "'", "")
l_0_2 = string.gsub(l_0_2, "`", "")
local l_0_3 = false
local l_0_4 = false
local l_0_5 = false
if string.find(l_0_2, "http", 1, true) then
  l_0_3 = true
end
if string.find(l_0_2, ".txt,c:\\.+\\.+.ps1") then
  l_0_4 = true
end
if string.find(l_0_2, ".invoke(", 1, true) or string.find(l_0_2, ".run(", 1, true) or string.find(l_0_2, ").shellexecute(", 1, true) or string.find(l_0_2, "process]::start(", 1, true) or string.find(l_0_2, ";&c:\\", 1, true) or string.find(l_0_2, ";.c:\\", 1, true) or string.find(l_0_2, ";&$", 1, true) or string.find(l_0_2, ";invoke-command", 1, true) or string.find(l_0_2, ";cmd/c", 1, true) or string.find(l_0_2, ";start-processpowershell", 1, true) or string.find(l_0_2, "binpath=powershell", 1, true) or string.find(l_0_2, "binarypathnamepowershell", 1, true) or string.find(l_0_2, "schtasks/create", 1, true) or string.find(l_0_2, "/interactivepowershell", 1, true) or string.find(l_0_2, ";rundll32printui", 1, true) or string.find(l_0_2, ";import-modulec:\\temp", 1, true) or string.find(l_0_2, ";start-job", 1, true) or string.find(l_0_2, ";sal", 1, true) or string.find(l_0_2, "win32_process.+create") then
  l_0_5 = true
end
if l_0_3 and l_0_4 and l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
