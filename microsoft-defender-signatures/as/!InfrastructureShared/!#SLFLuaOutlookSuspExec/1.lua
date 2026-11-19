-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaOutlookSuspExec
-- Type: 12
-- Includes: GetEmailPaths
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 4194304 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not mp.get_mpattribute("Lua:DownFromWebMail") then
  if l_0_1 == nil or (string.len(l_0_1) < 50 or string.find(l_0_1, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) == nil) and (string.find(l_0_1, "\\downloads", 1, true) == nil or not isOutlookProcess()) then
    return mp.CLEAN
  end
  if string.find(l_0_1, ":\\recoverybin\\volume-", 1, true) ~= nil then
    return mp.CLEAN
  end
end
if l_0_2 == nil or string.len(l_0_2) < 9 then
  return mp.CLEAN
end
local l_0_3 = l_0_2:sub(-4)
local l_0_4 = l_0_2:sub(-3)
local l_0_5 = {
  [".jse"] = true,
  [".vbs"] = true,
  [".wsf"] = true,
  [".vbe"] = true,
  [".hta"] = true,
  [".bat"] = true,
  [".ps1"] = true,
  [".cmd"] = true,
  [".exe"] = true,
  [".scr"] = true,
  [".pif"] = true,
  [".js"] = true,
  [".ace"] = true,
  [".htm"] = true
}
if l_0_5[l_0_3] == true or l_0_5[l_0_4] == true then
  return mp.INFECTED
end
return mp.CLEAN
