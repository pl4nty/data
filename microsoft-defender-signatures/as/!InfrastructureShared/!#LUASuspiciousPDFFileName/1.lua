-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousPDFFileName
-- Type: 13
-- MpAttributes: BM_PDF_FILE & SCPT:Spammer:PDF/Anonmail_Tit

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = mp.getfilesize()
if l_0_1 < 65536 and 327680 < l_0_1 then
  return mp.CLEAN
end
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "output%.%d%d%d%d%d%d%d+%.txt") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
