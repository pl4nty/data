-- Threat: !InfrastructureShared
-- Name: !#IGNORE:DecodedStub
-- Type: 24
-- MpAttributes: BM_MZ_FILE

if string.sub(mp.getfilename(), -16) == "->(EmbeddedCode)" then
  return mp.INFECTED
end
return mp.CLEAN
