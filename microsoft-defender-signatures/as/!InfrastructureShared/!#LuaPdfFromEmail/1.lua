-- Threat: !InfrastructureShared
-- Name: !#Lua:PdfFromEmail
-- Type: 13
-- MpAttributes: BM_PDF_FILE & InEmail

local l_0_0 = mp.getfilesize()
if l_0_0 < 1048576 then
  mp.set_mpattribute("PDF:ScanAllUris")
end
return mp.CLEAN
