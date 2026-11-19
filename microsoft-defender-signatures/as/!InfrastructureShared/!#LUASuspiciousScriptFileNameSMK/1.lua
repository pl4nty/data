-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameSMK
-- Type: 13
-- MpAttributes: (BM_SCRIPT_OR_TEXT_FILE) | (SCRIPT:WsfTag)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "actdetails_april%(%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "projectfunding_%a%d%d%d%.wsf") ~= nil or string.find(l_0_0, "projectfunding_%a%d%d%d_apr%d%d%.wsf") ~= nil or string.find(l_0_0, "erc_%a%d%d%d_may3%.wsf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
