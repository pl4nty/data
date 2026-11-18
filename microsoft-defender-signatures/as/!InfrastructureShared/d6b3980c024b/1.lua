-- Threat: !InfrastructureShared
-- Name: d6b3980c024b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line or "")
local l_0_2 = ""
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 and l_0_3.image_path then
  l_0_2 = string.lower(l_0_3.image_path)
end
local l_0_4 = {
  "\\w3wp.exe",
  "fastcgi",
  "\\tomcat",
  "\\java.exe",
  "\\javaw.exe",
  "\\httpd.exe",
  "\\nginx.exe",
  "php-cgi.exe",
  "\\catalina",
  "securitytomcat.exe"
}
if not contains(l_0_2, l_0_4) then
  return mp.CLEAN
end
bm.add_related_string("[->] AMSI-FAIL WEBSHELL PARENT: ", l_0_2, bm.RelatedStringBMReport)
bm.add_related_string("[->] AMSI-FAIL WEBSHELL CMD: ", l_0_1, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailWebShell.AM")
add_parents()
return mp.INFECTED
