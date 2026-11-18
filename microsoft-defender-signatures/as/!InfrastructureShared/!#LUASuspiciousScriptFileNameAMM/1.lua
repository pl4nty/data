-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameAMM
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & SCRIPT:StringFromCharCode.A & SCRIPT:base64 & SCPT:Exploit:JS/Blacole.forloop & TrojanDownloader:JS/Vdehudb

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "vertragsentwurf.chm") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
