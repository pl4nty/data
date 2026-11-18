-- Threat: !InfrastructureShared
-- Name: !#Lua:InteractivePSClassifier
-- Type: 12
-- Includes: BMLuaLib
-- MpAttributes: MpPowershellAmsiViaCmdLine

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
if l_0_0 and not contains(l_0_1, {
  "powershell.exe",
  "pwsh.exe"
}) then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if l_0_2 <= 0 or 1500 < l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = mp.GetProcessCommandLine(l_0_3)
if l_0_4 == nil or string.len(l_0_4) == 0 then
  return mp.CLEAN
end
local l_0_5 = mp.GetParentProcInfo(l_0_3)
if l_0_5 == nil or type(l_0_5.image_path) ~= "string" then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5.image_path)
local l_0_7 = string.find(l_0_6, "explorer.exe", 1, true)
if l_0_7 then
  mp.set_mpattribute("Lua:MpPowershellAmsiViaCmdLinePPExplorer")
end
if contains(l_0_4, {
  ".ps1",
  ".psd1",
  ".psm1"
}) then
  return mp.CLEAN
end
if not l_0_7 and not string.find(l_0_6, "windowsterminal.exe", 1, true) and not string.find(l_0_6, "wt.exe", 1, true) then
  mp.set_mpattribute("Lua:TerminalFixPSState")
  return mp.CLEAN
end
local l_0_8 = string.lower(tostring(headerpage))
if #l_0_8 == 0 then
  return mp.CLEAN
end
local l_0_9 = string.find
local l_0_11 = l_0_9(l_0_8, "$", 1, true) ~= nil
if l_0_11 and (l_0_9(l_0_8, ".", 1, true) ~= nil or l_0_9(l_0_8, "&", 1, true) ~= nil) then
  local l_0_12 = "(?:^|[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$(?:[a-z_][a-z0-9_]*|\\{(?:(?:global|script|local|private):)?[a-z_][a-z0-9_]*\\}|(?:global|script|local|private):[a-z_][a-z0-9_]*)(?:[ \\t]*\\))?(?:[ \\t]*\\[[^\\]\\r\\n;]+\\])*(?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)"
  if MpCommon.StringRegExpSearch(l_0_12, l_0_8) then
    mp.set_mpattribute("Lua:InteractivePSDynamicCalling")
  end
end
local l_0_14 = l_0_9(l_0_8, "gcm", 1, true) ~= nil or l_0_9(l_0_8, "get-command", 1, true) ~= nil
local l_0_16 = l_0_9(l_0_8, "gmo", 1, true) ~= nil or l_0_9(l_0_8, "get-module", 1, true) ~= nil
local l_0_18 = l_0_9(l_0_8, "ipmo", 1, true) ~= nil or l_0_9(l_0_8, "import-module", 1, true) ~= nil
if l_0_11 and l_0_9(l_0_8, "[", 1, true) ~= nil and l_0_9(l_0_8, "]", 1, true) ~= nil then
  local l_0_19 = "\\$[a-z_][a-z0-9_]*\\s*=\\s*\\$\\1\\s*\\[\\s*[^\\]\\r\\n;]+\\s*\\]"
  local l_0_20 = "(?:[;=({|]|\\r?\\n)[ \\t]*[.&][ \\t]*(?:\\([ \\t]*){0,2}\\$\\1(?:[ \\t]*\\))?[ \\t]*\\[[ \\t]*[^\\]\\r\\n;]+[ \\t]*\\](?:[ \\t]*\\)){0,2}(?:[ \\t\\r\\n;(]|$)"
  local l_0_21 = "(?:" .. l_0_19 .. "|" .. l_0_20 .. ")"
  local l_0_22 = false
  if l_0_14 then
    local l_0_23 = "\\$([a-z_][a-z0-9_]*)\\s*=\\s*\\(?\\s*(?:gcm|get-command)\\b[^\\r\\n;|]*?\\)?(?:\\s*\\.\\s*name\\b|\\s*;\\s*\\$\\1\\s*=\\s*\\$\\1\\s*\\.\\s*name\\b)"
    l_0_22 = MpCommon.StringRegExpSearch(l_0_23 .. "[^\\r\\n]{0,768}?" .. l_0_21, l_0_8)
  end
  if not l_0_22 and (l_0_16 or l_0_18) then
    local l_0_24 = string.gsub(l_0_8, "[%s'\"%+]", "")
    if l_0_9(l_0_24, "exportedcommands", 1, true) ~= nil and l_0_9(l_0_24, "values", 1, true) ~= nil and l_0_9(l_0_24, "name", 1, true) ~= nil then
      if l_0_16 then
        local l_0_25 = "\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:gmo|get-module)\\b"
        l_0_22 = MpCommon.StringRegExpSearch(l_0_25 .. "[^\\r\\n]{0,768}?" .. l_0_21, l_0_8)
      end
      if not l_0_22 and l_0_18 and l_0_9(l_0_8, "-pa", 1, true) ~= nil then
        local l_0_26 = "\\$([a-z_][a-z0-9_]*)\\s*=\\s*(?:ipmo|import-module)\\b(?=[^;\\r\\n|]*?\\s-pa(?:s(?:s(?:t(?:h(?:r(?:u)?)?)?)?)?)?\\b)"
        l_0_22 = MpCommon.StringRegExpSearch(l_0_26 .. "[^\\r\\n]{0,768}?" .. l_0_21, l_0_8)
      end
    end
  end
  if l_0_22 then
    mp.set_mpattribute("Lua:InteractivePSCommandIndexing")
  end
end
if not l_0_14 and not l_0_16 and not l_0_18 then
  return mp.CLEAN
end
local l_0_27 = false
local l_0_28
if l_0_14 then
  local l_0_29 = "(?:\\bgcm\\b|\\bget-command\\b)[^;\\r\\n|]*?\\s-(?:m(?:o(?:d(?:u(?:l(?:e)?)?)?)?)?|ps(?:s(?:n(?:a(?:p(?:i(?:n)?)?)?)?)?)?)(?:\\s+|:\\s*)(['\"]?)([^'\"\\s;|),]+)\\1"
  l_0_27, _, l_0_28 = MpCommon.StringRegExpSearch(l_0_29, l_0_8)
end
if not l_0_27 and l_0_16 then
  local l_0_30 = "(?:\\bgmo\\b|\\bget-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)(['\"]?)((?!-)[^'\"\\s;|),]+)\\1"
  l_0_27, _, l_0_28 = MpCommon.StringRegExpSearch(l_0_30, l_0_8)
end
if not l_0_27 and l_0_18 then
  local l_0_31 = "(?:\\bipmo\\b|\\bimport-module\\b)(?:[^;\\r\\n|]*?\\s-n(?:a(?:m(?:e)?)?)?(?:\\s+|:\\s*)|\\s+)(['\"]?)((?!-)[^'\"\\s;|),]+)\\1"
  l_0_27, _, l_0_28 = MpCommon.StringRegExpSearch(l_0_31, l_0_8)
end
if not l_0_27 then
  return mp.CLEAN
end
local l_0_32 = "microsoft.powershell.utility"
if l_0_28 == l_0_32 then
  mp.set_mpattribute("Lua:InteractivePSUtilityModuleSelector")
  return mp.CLEAN
end
if l_0_9(l_0_28, "*", 1, true) == nil and l_0_9(l_0_28, "?", 1, true) == nil then
  return mp.CLEAN
end
local l_0_33 = string.gsub(l_0_28, "([%%%^%$%(%)%.%[%]%+%-])", "%%%1")
l_0_33 = string.gsub(l_0_33, "%*", string.char(46, 42))
l_0_33 = string.gsub(l_0_33, "%?", ".")
l_0_33 = "^" .. l_0_33 .. "$"
if string.match(l_0_32, l_0_33) ~= nil then
  mp.set_mpattribute("Lua:InteractivePSUtilityModuleSelector")
end
return mp.CLEAN
