-- Threat: \xac!Malagent.SC
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE & Lua:TopLevelUnsigned

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if not mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ":\\perflogs") and not StringEndsWith(l_0_0, ":\\users\\public\\music") and not StringEndsWith(l_0_0, ":\\users\\public") then
  return mp.CLEAN
end
local l_0_2 = {
  ["chrome.exe"] = true,
  ["explorer.exe"] = true,
  ["swchost.exe"] = true,
  ["svchost.exe"] = true,
  ["svvhost.exe"] = true,
  ["svchost.dll"] = true
}
local l_0_3 = false
if l_0_2[l_0_1] then
  l_0_3 = true
end
if not l_0_3 and contains(l_0_1, {
  "pagefile%w+%.exe",
  "swapfile%w+%.exe",
  "tmuninst%w+%.exe",
  "toolbox_client_uninst%w+%.exe"
}) then
  l_0_3 = true
end
if l_0_3 then
  if mp.IsTrustedFile(false) == true then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
