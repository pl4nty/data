-- Threat: Trojan:Script/ObfusJsLongVar.A
-- Type: 13
-- Includes: PHelpers
-- MpAttributes: Lua:JSExt & SCPT:Obfuscator.LongVariableName.A & SCPT:JS/parseInt.A & SCPT:FileSizeAggr200k.A & SCPT:JS/StringFromCharCodeCharCodeAt & SCPT:BasicAlphabet

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 500000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_1 == nil then
  return mp.CLEAN
end
if true == IsInternetCache(l_0_1) or true == IsLowConfNPath(l_0_1) then
  return mp.CLEAN
end
if l_0_1:find("\\program files\\", 1, true) or l_0_1:find(":\\windows\\", 1, true) or l_0_1:find(":\\program files (x86)\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
if l_0_2 ~= nil then
  local l_0_3 = l_0_2:match("[^\\]+$")
  local l_0_4 = {
    ["wscript.exe"] = "",
    ["cscript.exe"] = ""
  }
  if l_0_3 ~= nil and l_0_4[l_0_3] then
    return mp.INFECTED
  end
end
return mp.CLEAN
