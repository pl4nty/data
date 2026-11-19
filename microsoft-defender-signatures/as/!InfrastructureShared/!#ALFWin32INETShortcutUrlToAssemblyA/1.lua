-- Threat: !InfrastructureShared
-- Name: !#ALF:Win32/INETShortcutUrlToAssembly.A
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: Lua:URLExt & SCPT:INETShortcutUrl_EXE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if isnull(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = mp.getfilesize()
if 1024000 < l_0_4 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_5 = tostring(mp.readfile(0, l_0_4))
mp.readprotection(true)

local function l_0_6(l_1_0)
  local l_1_1 = string.lower(l_1_0)
  l_1_1 = string.match(l_1_1, "^%s*(.-)%s*$") or l_1_1
  l_1_1 = string.match(l_1_1, "^\"(.-)\"$") or l_1_1
  l_1_1 = string.gsub(l_1_1, "%%(%x%x)", function(l_2_0)
    return string.char(tonumber(l_2_0, 16))
  end)
  local l_1_2 = string.match(l_1_1, "^file:///(.+)$")
  if isnull(l_1_2) then
    l_1_2 = string.match(l_1_1, "^file://localhost/(.+)$")
  end
  if isnull(l_1_2) then
    l_1_2 = string.match(l_1_1, "^file://(.+)$")
  end
  if isnull(l_1_2) then
    l_1_2 = string.match(l_1_1, "^file:\"(.-)\"$")
  end
  if isnull(l_1_2) then
    l_1_2 = string.match(l_1_1, "^([a-z]:[/\\].+)$")
  end
  if isnull(l_1_2) then
    return nil
  end
  return string.gsub(l_1_2, "/", "\\")
end

local l_0_7 = string.match(l_0_5, "[Uu][Rr][Ll]=([^\r\n]+)")
if isnull(l_0_7) then
  return mp.CLEAN
end
local l_0_8 = l_0_6(l_0_7)
if isnull(l_0_8) then
  return mp.CLEAN
end
local l_0_9 = MpCommon.PathToWin32Path(l_0_8)
if isnull(l_0_9) then
  return mp.CLEAN
end
local l_0_10 = "INETShortcutUrlToAssembly"
MpCommon.BmTriggerSig(l_0_3, string.format("%s!%s", l_0_10, l_0_2), l_0_9)
local l_0_11 = {url_filepath = l_0_2, exe_filepath = l_0_9}
local l_0_12 = safeJsonSerialize(l_0_11)
mp.SetDetectionString(l_0_12)
return mp.INFECTED
