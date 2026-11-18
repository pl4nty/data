-- Threat: !InfrastructureShared
-- Name: !#LUA:DelphiSuspiciousFileSS
-- Type: 13
-- MpAttributes: BM_MZ_FILE & SIGATTR:DelphiFile & LUA:FileSizeLE1M.A

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or string.len(l_0_0) <= 5 then
  return mp.CLEAN
end
if string.find(l_0_0, ".pdf.exe", 1, true) or string.find(l_0_0, ",pdf.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
