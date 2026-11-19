-- Threat: !InfrastructureShared
-- Name: 8129b657d692
-- Type: 21

if mp.get_mpattribute("BM_XML_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
