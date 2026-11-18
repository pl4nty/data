-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextOutlookHTMLAttachment
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & MpOnOpenOrCloseRtpScan & MpNewlyCreatedHint & SCPT:HTMLFile & SCRIPT:HasScriptTag.A & !BM_PDF_FILE

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0:find("\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) ~= nil then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "outlook.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
