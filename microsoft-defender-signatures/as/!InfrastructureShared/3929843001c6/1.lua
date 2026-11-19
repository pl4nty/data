-- Threat: !InfrastructureShared
-- Name: 3929843001c6
-- Type: 21

if mp.get_mpattribute("BM_PDF_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
