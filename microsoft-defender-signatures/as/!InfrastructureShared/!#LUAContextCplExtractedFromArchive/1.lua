-- Threat: !InfrastructureShared
-- Name: !#LUA:ContextCplExtractedFromArchive
-- Type: 13
-- MpAttributes: BM_MZ_DLL & TopLevelFile & Lua:CPLExt & MpNewlyCreatedHint & MpOnOpenOrCloseRtpScan

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.match(l_0_1, "\\users\\[^\\]+\\appdata\\local\\temp\\rar$.+") then
    mp.set_mpattribute("Lua:CplWinrarExtracted.A")
    return mp.INFECTED
  end
  if l_0_1:find("\\temp\\7zo", 1, true) ~= nil then
    mp.set_mpattribute("Lua:Cpl7ZipExtracted.A")
    return mp.INFECTED
  end
  if l_0_1:find("\\temp\\wz[0-9a-f][0-9a-f][0-9a-f][0-9a-f]$") ~= nil then
    mp.set_mpattribute("Lua:CplWinZipExtracted.A")
    return mp.INFECTED
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_2 == "7zg.exe" and (l_0_1:find("\\desktop\\", 1, true) ~= nil or l_0_1:find("\\downloads\\", 1, true) ~= nil) then
    mp.set_mpattribute("Lua:Cpl7ZipExtracted.B")
  end
  if l_0_2 == "explorer.exe" then
    if l_0_1:find("\\temp\\temp[0-9]_.+%.zip$" ~= nil) then
      mp.set_mpattribute("Lua:CplExplorerZIPExtracted.A")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
