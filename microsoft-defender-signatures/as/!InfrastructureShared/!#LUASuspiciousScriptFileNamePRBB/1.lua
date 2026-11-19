-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNamePRBB
-- Type: 13
-- MpAttributes: (BM_SCRIPT_OR_TEXT_FILE) & LUA:FileSizeLE40000.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "startapril%(%a%a%d%d%d%d%) %(%d%)%.wsf") ~= nil or string.find(l_0_0, "startapril%(%a%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "startapril%(%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprilclaim%(%a%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprilclaim%(%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprildetails%(%a%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprildetails%(%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprilinv%(%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "aprilinv%(%a%a%d%d%d%d%)%.wsf") ~= nil or string.find(l_0_0, "activity%-april%(%d%d%d%d%)%.wsf") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
