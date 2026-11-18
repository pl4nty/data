-- Threat: !InfrastructureShared
-- Name: 2540d019b85b
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 and l_0_1 and string.find(l_0_1, "app_web_signout.aspx.", 1, true) and string.find(l_0_0, "\\temporary asp.net files", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
