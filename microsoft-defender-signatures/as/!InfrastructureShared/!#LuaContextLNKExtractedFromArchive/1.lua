-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextLNKExtractedFromArchive
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:LNKExt & BM_LNK_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\temp\\rar$", 1, true) ~= nil then
    mp.set_mpattribute("Lua:ContextLNKWinRARExtracted.A")
  end
  if l_0_1:find("\\temp\\7zo", 1, true) ~= nil then
    mp.set_mpattribute("Lua:ContextLNK7ZipExtracted.A")
  end
  if l_0_1:find("\\temp\\wz[0-9a-f][0-9a-f][0-9a-f][0-9a-f]$") ~= nil then
    mp.set_mpattribute("Lua:ContextLNKWinZipExtracted.A")
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_2 == "7zg.exe" and (l_0_1:find("\\desktop\\", 1, true) ~= nil or l_0_1:find("\\downloads\\", 1, true) ~= nil) then
    mp.set_mpattribute("Lua:ContextLNK7ZipExtracted.B")
  end
  if l_0_2 == "explorer.exe" and l_0_1:find("\\temp\\temp[0-9]_.+%.zip$") ~= nil then
    mp.set_mpattribute("Lua:ContextLNKExplorerZIPExtracted.A")
  end
end
return mp.CLEAN
