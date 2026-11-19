-- Threat: \xac!Jumplump.C!dha
-- Type: 9
-- MpAttributes: !PEPCODE:HasDigitalSignature

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("\\system32\\spool\\drivers\\color\\", 1, true) then
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("applicationframe", 1, true) or l_0_1:find("wmiprvsd", 1, true) or l_0_1:find("wuapi", 1, true) or l_0_1:find("propsys", 1, true) or l_0_1:find("wbemprox", 1, true) or l_0_1:find("actioncenter", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
