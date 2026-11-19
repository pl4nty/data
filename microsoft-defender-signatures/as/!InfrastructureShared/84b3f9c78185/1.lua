-- Threat: !InfrastructureShared
-- Name: 84b3f9c78185
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = string.lower(l_0_0.command_line or "")
local l_0_3 = {
  "consctlx.exe",
  "reload.exe",
  "\\escan\\"
}
if contains(l_0_1, l_0_3) or contains(l_0_2, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_2, "/processid:(%b{})") or "unknown"
bm.add_related_string("[->] AMSI-FAIL COM SURROGATE CLSID: ", l_0_4, bm.RelatedStringBMReport)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailComSurrogate.AM")
add_parents()
return mp.INFECTED
