-- Threat: !InfrastructureShared
-- Name: ab292d509f53
-- Type: 21

if mp.get_mpattribute("BM_PDF_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
