-- Threat: !InfrastructureShared
-- Name: !#Lua:PU2RD.1
-- Type: 24
-- MpAttributes: BM_PDF_FILE & (MpInternal_IsPliScan | Lua:Guid.1 | MpForceLowfiMatch | //Lua:ContextFromWebmail | //Lua:ContextualDropFileByEmailClientTag)

if mp.get_mpattribute("!#SLF:PDF/Spike.B!rfn") or mp.get_mpattribute("!#ALF:PDF/Spike.A!rfn") or mp.get_mpattribute("!#ALF:PDF/Spike.B!rfn") then
  mp.set_mpattribute("PDF:ScanAllUris")
end
return mp.CLEAN
