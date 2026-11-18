-- Threat: !InfrastructureShared
-- Name: !#pdfrtfole2link
-- Type: 13
-- MpAttributes: SCPT:OLE2Link

if string.len(mp.getfilename()) < 8 then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, ".pdf->(rtf", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
