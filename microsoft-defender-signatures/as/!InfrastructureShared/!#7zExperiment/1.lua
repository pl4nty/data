-- Threat: !InfrastructureShared
-- Name: !#7zExperiment
-- Type: 27

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return false
end

local function l_0_1(l_1_0, l_1_1)
  return l_1_1 == "" or string.sub(l_1_0, -string.len(l_1_1)) == l_1_1
end

local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
local l_0_4 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_1(l_0_4, ".dll") and l_0_2 == l_0_3 then
  return false
end
local l_0_5 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
local l_0_7 = string.find(l_0_3, "\\program files\\7-zip", 1, true) ~= nil or string.find(l_0_3, "\\program files (x86)\\7-zip", 1, true) ~= nil
local l_0_9 = l_0_7 and string.sub(l_0_5, 1, 2) == "7z" and (l_0_5 == "7z.exe" or l_0_5 == "7za.exe" or l_0_5 == "7zfm.exe" or l_0_5 == "7zg.exe" or string.find(l_0_5, "7z%d%d%d%d%-x64%.exe") ~= nil or string.find(l_0_5, "7z%d%d%d%d%.exe") ~= nil)
local l_0_11 = string.find(l_0_3, "\\program files\\winrar", 1, true) ~= nil or string.find(l_0_3, "\\program files (x86)\\winrar", 1, true) ~= nil
local l_0_13 = l_0_11 and (l_0_5 == "rar.exe" or l_0_5 == "unrar.exe" or l_0_5 == "winrar.exe")
if l_0_9 or l_0_13 then
  local l_0_14 = MpCommon.PathToWin32Path(l_0_3 .. "\\" .. l_0_5)
  if mp.IsKnownFriendlyFile(l_0_14, true, true) then
    return true
  end
end
return false
