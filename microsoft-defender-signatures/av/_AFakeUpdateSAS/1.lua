-- Threat: \xadAFakeUpdate.SAS
-- Type: 13
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & (RPF:AnyFileHasIOAVURL | Lua:HasMotw)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = {
  "^u\209\128dateinst\208\176ller%.zip$",
  "^u\209\128date%.js$",
  "^update_[0-9]+%.js$"
}
if contains(l_0_0, l_0_1, false) then
  return mp.INFECTED
end
return mp.CLEAN
