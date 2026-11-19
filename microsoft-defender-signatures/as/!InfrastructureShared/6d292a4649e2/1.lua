-- Threat: !InfrastructureShared
-- Name: 6d292a4649e2
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
