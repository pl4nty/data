-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaOutlookSuspFileInArchive
-- Type: 12
-- Includes: GetEmailPaths

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not mp.get_mpattribute("Lua:DownFromWebMail") and (l_0_1 == nil or (string.len(l_0_1) < 50 or string.find(l_0_1, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) == nil) and (string.find(l_0_1, "\\downloads", 1, true) == nil or not isOutlookProcess())) then
  return mp.CLEAN
end
if l_0_2 == nil or string.len(l_0_2) < 12 then
  return mp.CLEAN
end
local l_0_3 = l_0_2:sub(-4)
local l_0_4 = l_0_2:sub(-6)
local l_0_5 = {
  [".jse"] = true,
  [".vbs"] = true,
  [".wsf"] = true,
  [".vbe"] = true,
  [".hta"] = true,
  [".mht"] = true,
  [".bat"] = true,
  [".ps1"] = true,
  [".cmd"] = true,
  [".url"] = true,
  [".exe"] = true,
  [".scr"] = true,
  [".pif"] = true,
  [".lnk"] = true,
  [".docx"] = true,
  [".xlsx"] = true,
  [".doc"] = true,
  [".xls"] = true,
  [".rtf"] = true,
  docm = true,
  xlsm = true,
  ppam = true,
  pptm = true,
  ppsm = true,
  potm = true
}
if l_0_5[l_0_3] == true or l_0_5[l_0_4] == true then
  if not l_0_2:find(".iso->", 1, true) and not l_0_2:find(".arj->", 1, true) and not l_0_2:find(".gz->", 1, true) and not l_0_2:find(".xz->", 1, true) and not l_0_2:find(".ace->", 1, true) and not l_0_2:find(".z->", 1, true) and not l_0_2:find(".vhd->", 1, true) and not l_0_2:find(".vhdx->", 1, true) and not l_0_2:find("ppkg->", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
