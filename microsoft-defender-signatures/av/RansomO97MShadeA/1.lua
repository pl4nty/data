-- Threat: Ransom:O97M/Shade.A
-- Type: 13
-- MpAttributes: SCPT:Ransom:O97M/Shade.A & AGGR:OfficeFileOLE_1

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == "fullcachefile" or l_0_1 == "hotcachefile" then
  return mp.CLEAN
end
if l_0_0:find("\\tanium client\\downloads\\cache", 1, true) ~= nil then
  return mp.CLEAN
end
return mp.INFECTED
