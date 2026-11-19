-- Threat: !InfrastructureShared
-- Name: d6b3289d0953
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, Path

local l_0_0 = bm.get_current_process_startup_info()
if not l_0_0 or not next(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line or "")
if l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 and l_0_3.image_path then
  l_0_2 = string.lower(l_0_3.image_path)
end
if contains(l_0_2, {
  "agentexecutor.exe",
  "\\code.exe",
  "windowsterminal.exe"
}) then
  return mp.CLEAN
end
if contains(l_0_2, {
  "consctlx.exe",
  "reload.exe",
  "\\escan\\"
}) or contains(l_0_1, {
  "\\escan\\",
  "\\.vscode\\extensions\\"
}) then
  return mp.CLEAN
end
if contains(l_0_1, {
  "169.254.169.254",
  "metadata.google",
  "metadata.azure"
}) then
  return mp.CLEAN
end

local function l_0_4(l_1_0)
  for l_1_1 = 2, #l_1_0 do
    local l_1_2 = string.lower(l_1_0[l_1_1])
    if StringEndsWith(l_1_2, ".ps1") then
      return nil
    end
    local l_1_3 = string.match(l_1_2, "^[-/](%a+)$")
    if l_1_3 then
      if string.sub("file", 1, #l_1_3) == l_1_3 then
        return l_1_0[l_1_1 + 1]
      end
      if l_1_3 == "ec" or l_1_3 == "cwa" or string.sub("command", 1, #l_1_3) == l_1_3 or string.sub("encodedcommand", 1, #l_1_3) == l_1_3 or string.sub("commandwithargs", 1, #l_1_3) == l_1_3 then
        return nil
      end
    end
  end
  return nil
end

local l_0_5 = MpCommon.CommandLineToArgv(l_0_1)
if not l_0_5 or not next(l_0_5) then
  return mp.CLEAN
end
local l_0_6 = l_0_4(l_0_5)
if not l_0_6 then
  return mp.CLEAN
end
l_0_6 = normalize_path(l_0_6)
if not (l_0_6 and StringEndsWith(l_0_6, ".ps1")) or not contains(l_0_6, {
  "\\appdata\\",
  "\\programdata\\"
}) then
  return mp.CLEAN
end
bm.add_related_string("[->] AMSI-FAIL USER-PATH PS1: ", l_0_1, bm.RelatedStringBMReport)
bm_AddRelatedFileFromCommandLine(l_0_1, nil, nil, 1)
if l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1)
end
triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/AmsiFailUserPathPs1.AM")
add_parents()
return mp.INFECTED
