-- Threat: !InfrastructureShared
-- Name: 6e2988b533ce
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") and mp.get_mpattribute("InEmail") then
  return mp.INFECTED
end
return mp.CLEAN
