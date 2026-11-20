-- Threat: !InfrastructureShared
-- Name: 1c3b318a3d1af
-- Type: 21
-- Includes: BMLuaLib

local function l_0_0(l_1_0)
  if type(l_1_0) ~= "string" then
    return nil
  end
  local l_1_1 = l_1_0:match("\"([^\"]-%.[dD][lL][lL])\"")
  if l_1_1 then
    return l_1_1
  end
  local l_1_2 = l_1_0:match("([a-zA-Z]:[\\/][^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_2 then
    return l_1_2
  end
  local l_1_3 = l_1_0:match("(\\\\[^<>:\"|%?%*]-%.[dD][lL][lL])")
  if l_1_3 then
    return l_1_3
  end
  return (l_1_0:match("([%w%._%-%\\/%(%)~]+%.[dD][lL][lL])"))
end

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if this_sigattrlog[2].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(this_sigattrlog[2].utf8p2)
local l_0_2 = bm.get_imagepath()
if l_0_2 ~= nil then
  l_0_2 = string.lower(l_0_2)
  if string.find(l_0_2, "\\windows defender\\", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_2, "\\sense\\", 1, true) then
    return mp.CLEAN
  end
end
local l_0_3 = {
  "shell32.dll",
  "printui.dll",
  "dfshim.dll",
  "davclnt.dll",
  "url.dll",
  "shdocvw.dll",
  "ieframe.dll",
  "ndfapi.dll",
  "keymgr.dll",
  "cryptui.dll",
  "zipfldr.dll",
  "desk.cpl",
  "inetcpl.cpl",
  "acproxy.dll",
  "appwiz.cpl",
  "sysmain.dll"
}
if contains(l_0_1, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_0(l_0_1)
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_4)
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5)
local l_0_7 = {
  "\\windows\\system32\\",
  "\\windows\\syswow64\\",
  "\\program files\\",
  "\\program files (x86)\\",
  "\\programdata\\microsoft\\"
}
if contains(l_0_6, l_0_7) then
  return mp.CLEAN
end
if mp.IsKnownFriendlyFile(l_0_5, true, false) then
  return mp.CLEAN
end
local l_0_8 = bm.get_current_process_startup_info()
if l_0_8 and next(l_0_8) and l_0_8.command_line then
  local l_0_9 = string.lower(l_0_8.command_line)
  bm_AddRelatedFileFromCommandLine(l_0_9, nil, nil, 1)
  bm.request_SMS(l_0_8.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
  bm.add_related_string("[->] MEDICATED CMD: ", l_0_9, bm.RelatedStringBMReport)
end
triggerMemoryScanOnProcessTree(true, false, "SMS_H", 5000, "Behavior:Win32/SusDllExec.AL!sms")
add_parents()
return mp.INFECTED
