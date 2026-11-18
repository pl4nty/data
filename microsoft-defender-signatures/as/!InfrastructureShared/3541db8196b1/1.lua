-- Threat: !InfrastructureShared
-- Name: 3541db8196b1
-- Type: 21

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if string.match(l_0_0, "\\amazon\\codedeploy\\bin") ~= nil and l_0_1 == "winagent.exe" or string.match(l_0_0, "\\spiceworks") ~= nil and l_0_1 == "spiceworks_safemode.exe" then
  return mp.CLEAN
end
return mp.INFECTED
