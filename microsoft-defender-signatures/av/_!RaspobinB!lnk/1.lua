-- Threat: \xac!Raspobin.B!lnk
-- Type: 13
-- MpAttributes: BM_LNK_FILE & SCPT:Win32/Raspobin.A1 & SCPT:Win32/Raspobin.A2

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= nil and l_0_0:match("^%..*%.lnk") then
  return mp.INFECTED
end
return mp.CLEAN
