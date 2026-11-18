-- Threat: !InfrastructureShared
-- Name: !#LUA:HttpLinkScriptInPPT
-- Type: 13
-- MpAttributes: SCPT:XML/RemoteHttpScript & BM_XML_FILE

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%-%>ppt%/") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
