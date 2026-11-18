-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousScriptFileNameSM1
-- Type: 13
-- MpAttributes: BM_TEXT_FILE & (BM_ScriptFile)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "w9%-883748479.htm") ~= nil or string.find(l_0_0, "inv%-901926.html") ~= nil or string.find(l_0_0, "invoice l12217 from lep engineering plastics ltd.html", 1, true) ~= nil or string.find(l_0_0, "payoff_0130202_30999.html", 1, true) ~= nil or string.find(l_0_0, "ref%-paymentcopy%#%d%d+.shtm") ~= nil or string.find(l_0_0, "cauc2135354_202303011253.html", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
