-- Threat: !InfrastructureShared
-- Name: !#JSLocations
-- Type: 12
-- MpAttributes: Nscript:Type_js & BM_TEXT_FILE

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = false
if l_0_0:find("\\office\\recent", 1, true) or l_0_0:find("\\windows\\recent", 1, true) or l_0_0:find("\\microsoft\\teams\\", 1, true) or l_0_0:find("\\adobetemp\\", 1, true) or l_0_0:find("\\node_modules\\", 1, true) or l_0_0:find("\\appdata\\local\\packages\\microsoft.windows", 1, true) or l_0_1:find("index.js", 1, true) or l_0_1:find("main.js", 1, true) then
  l_0_2 = true
end
if l_0_2 then
  mp.set_mpattribute("Lua:JSExclusions")
end
return mp.CLEAN
