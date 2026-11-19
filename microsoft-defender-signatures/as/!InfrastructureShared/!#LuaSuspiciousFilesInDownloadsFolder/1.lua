-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousFilesInDownloadsFolder
-- Type: 9
-- MpAttributes: RPF:TopLevelFile & pea_isexe & !pea_isdamaged

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 ~= nil and l_0_0:len() > 12 and l_0_1 ~= nil then
    local l_0_2 = false
    local l_0_3 = ""
    if l_0_0:sub(-10) == "\\downloads" then
      l_0_2 = true
      l_0_3 = "Lua:WrittenToDownloadFolder"
      mp.set_mpattribute(l_0_3)
    elseif l_0_0:find("\\downloads\\%w+$") ~= nil then
      l_0_2 = true
      l_0_3 = "Lua:WrittenToDownloadFolder1Sub"
      mp.set_mpattribute(l_0_3)
    end
    if l_0_2 == true then
      if l_0_1:len() > 64 then
        mp.set_mpattribute("Lua:WrittenToDownloadFolderWithLongFileName")
      end
      local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME) or ""
      if l_0_4 == "" then
        l_0_3 = l_0_3 .. "ByUnknownParentProcess"
      else
        local l_0_5 = {
          ["radeonsettings.exe"] = "Updater",
          ["razercentralservice.exe"] = "Updater",
          ["searchprotocolhost.exe"] = "WindowsBinary",
          ["explorer.exe"] = "Explorer",
          ["svchost.exe"] = "WindowsBinary",
          ["dllhost.exe"] = "WindowsBinary",
          ["7zg.exe"] = "Archiver",
          ["winzip64.exe"] = "Archiver",
          ["winrar.exe"] = "Archiver",
          ["chrome.exe"] = "Browser",
          ["opera.exe"] = "Browser",
          ["brave.exe"] = "Browser",
          ["bittorrent.exe"] = "Torrent",
          ["utorrent.exe"] = "Torrent"
        }
        local l_0_6 = l_0_5[l_0_4:lower()]
        if nil == l_0_6 then
          l_0_3 = l_0_3 .. "ByOtherParentProcess"
        else
          l_0_3 = l_0_3 .. "By" .. l_0_6
        end
      end
      mp.set_mpattribute(l_0_3)
    end
  end
end
return mp.CLEAN
