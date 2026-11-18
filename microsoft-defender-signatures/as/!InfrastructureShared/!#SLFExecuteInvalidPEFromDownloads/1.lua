-- Threat: !InfrastructureShared
-- Name: !#SLF:ExecuteInvalidPEFromDownloads
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & MpTrustCheck_HasInvalidSignature & LUA:FileSizeLE32M.B

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
if mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) ~= true then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if not l_0_1:find("\\downloads", 1, true) then
  return mp.CLEAN
end
if l_0_1:find("\\users\\[^\\]+\\downloads") == nil then
  return mp.CLEAN
end
if string.sub(l_0_1, -10) == "\\downloads" then
  return mp.INFECTED
end
if l_0_1:find("\\downloads\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
