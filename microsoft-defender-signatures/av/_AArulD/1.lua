-- Threat: \xadAArul.D
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:FileInsideAppDataFolder & Lua:JSExt

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == "google_update_checker.js" then
  return mp.INFECTED
end
if l_0_0 == "local_update_checker.js" then
  return mp.INFECTED
end
return mp.CLEAN
