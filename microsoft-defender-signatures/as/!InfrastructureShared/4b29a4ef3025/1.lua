-- Threat: !InfrastructureShared
-- Name: 4b29a4ef3025
-- Type: 21

if mp.get_mpattribute("BM_PDF_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
