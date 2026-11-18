-- Threat: !InfrastructureShared
-- Name: !#LUA:VBS/SuspiciousFilePR
-- Type: 13
-- MpAttributes: BM_SCRIPT_OR_TEXT_FILE & Nscript:Type_vbs & LUA:FileSizeLE500M.B & TARG:VBSWithExecute

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, "%.pdf_____+%.vbs") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
