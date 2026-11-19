-- Threat: !InfrastructureShared
-- Name: !#ALF:LuaWebMailAndMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & RPF:AnyFileHasIOAVURL

local l_0_0 = string.lower(mp.IOAVGetDownloadUrl())
if l_0_0 ~= nil and string.find(l_0_0, "_task=mail&_action=get&_mbox=inbox", 1, true) then
  mp.set_mpattribute("Lua:WebMailDownload")
  local l_0_1 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInZip")
  local l_0_2 = mp.get_mpattribute("Lua:RarHasFileWithExeExtension")
  local l_0_3 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
  local l_0_4 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInACE")
  local l_0_5 = mp.getfilesize()
  if l_0_5 <= 4194304 and (l_0_1 or l_0_2 or l_0_3 or l_0_4) then
    mp.set_mpattribute("MpForceScanArchives")
  end
  local l_0_6 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  local l_0_7 = l_0_6:sub(-3)
  local l_0_8 = l_0_6:sub(-4)
  local l_0_9 = l_0_6:sub(-5)
  local l_0_10 = {
    [".doc"] = true,
    [".xls"] = true,
    [".rtf"] = true,
    [".docm"] = true,
    [".xlsm"] = true,
    [".ppam"] = true,
    [".pptm"] = true,
    [".ppsm"] = true,
    [".potm"] = true,
    [".xlsx"] = true,
    [".docx"] = true,
    [".jse"] = true,
    [".vbs"] = true,
    [".wsf"] = true,
    [".vbe"] = true,
    [".hta"] = true,
    [".js"] = true,
    [".mht"] = true,
    [".lnk"] = true,
    [".bat"] = true,
    [".ps1"] = true,
    [".zip"] = true,
    [".rar"] = true,
    [".7z"] = true,
    [".iso"] = true,
    [".arj"] = true,
    [".gz"] = true,
    [".ace"] = true,
    [".xz"] = true,
    [".bz"] = true,
    [".r00"] = true,
    [".rev"] = true,
    [".exe"] = true,
    [".scr"] = true,
    [".pif"] = true,
    [".jar"] = true
  }
  if l_0_10[l_0_7] == true or l_0_10[l_0_8] == true or l_0_10[l_0_9] == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
