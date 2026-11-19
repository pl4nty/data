-- Threat: !InfrastructureShared
-- Name: !#Lua:OutlookAndMotw
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == false or mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.GetMOTWZone()
if l_0_0 ~= nil and 3 <= l_0_0 then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
  if l_0_1:lower() == "outlook.exe" then
    local l_0_2 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInZip")
    local l_0_3 = mp.get_mpattribute("Lua:RarHasFileWithExeExtension")
    local l_0_4 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
    local l_0_5 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInACE")
    local l_0_6 = mp.getfilesize()
    if l_0_6 <= 4194304 and (l_0_2 or l_0_3 or l_0_4 or l_0_5) then
      mp.set_mpattribute("MpForceScanArchives")
    end
    local l_0_7, l_0_8 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
    local l_0_9 = l_0_8:sub(-3)
    local l_0_10 = l_0_8:sub(-4)
    local l_0_11 = l_0_8:sub(-5)
    local l_0_12 = {
      [".doc"] = true,
      [".xls"] = true,
      [".rtf"] = true,
      [".docm"] = true,
      [".xlsm"] = true,
      [".ppam"] = true,
      [".pptm"] = true,
      [".ppsm"] = true,
      [".potm"] = true,
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
      [".exe"] = true,
      [".scr"] = true,
      [".pif"] = true,
      [".jar"] = true
    }
    if l_0_12[l_0_9] == true or l_0_12[l_0_10] == true or l_0_12[l_0_11] == true then
      if (l_0_10 == ".doc" or l_0_10 == ".xls") and true ~= mp.get_mpattribute("MHSTR:MacroInside") then
        return mp.CLEAN
      end
      return mp.LOWFI
    end
  end
end
return mp.CLEAN
