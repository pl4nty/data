-- Threat: !InfrastructureShared
-- Name: d6b3235e23e6
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line or "")
local l_0_2 = contains(l_0_1, {
  "get-itemproperty",
  "gp hklm:",
  "gp hkcu:",
  "gp registry::",
  "hklm:\\software",
  "hkcu:\\software",
  "get-itempropertyvalue"
})
local l_0_3 = contains(l_0_1, {
  "|iex",
  "| iex",
  "iex(",
  "iex (",
  ".invoke()",
  "invoke-expression"
})
if not l_0_2 or not l_0_3 then
  return mp.CLEAN
end
bm.add_related_string("[->] AMSI-FAIL REGISTRY-RESIDENT: ", l_0_1, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailRegResident.AM")
add_parents()
return mp.INFECTED
