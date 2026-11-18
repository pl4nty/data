-- Threat: !InfrastructureShared
-- Name: 6a29b5f75373
-- Type: 21

if mp.get_mpattribute("BM_PDF_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
