-- Threat: !InfrastructureShared
-- Name: !#ALF:ExcelDownloader!ibt
-- Type: 13
-- MpAttributes: SCPT:LNK/http & SCPT:SystemDll & !BM_XML_FILE

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or string.len(l_0_0) < 15 then
  return mp.CLEAN
end
if l_0_1 == nil or string.len(l_0_1) < 12 then
  return mp.CLEAN
end
if string.find(l_0_1, ".xlsb->", 1, true) then
  local l_0_2 = string.match(l_0_1, "%.xlsb%->.+")
  if l_0_2:find(">xl/macrosheets/", 1, true) and l_0_2:sub(-4) == ".bin" then
    return mp.INFECTED
  end
end
return mp.CLEAN
