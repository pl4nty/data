-- Threat: \xac!BgHunterConfig.gen!dha
-- Type: 13
-- MpAttributes: LUA:FileSizeLE40000.A & (BM_TEXT_FILE | BM_UNKNOWN_FILE) & LUA:FileSizeGT20000.A

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "a.help" and l_0_0 ~= "shashigeiing.help" then
  return mp.CLEAN
end
local l_0_1 = "\141\132\n\170\169\169\169\137"
mp.readprotection(false)
local l_0_2 = mp.readfile(150268, 8)
mp.readprotection(true)
if l_0_2 == l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
