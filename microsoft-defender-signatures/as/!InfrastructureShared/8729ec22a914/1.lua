-- Threat: !InfrastructureShared
-- Name: 8729ec22a914
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
