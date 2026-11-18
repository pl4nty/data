-- Threat: !InfrastructureShared
-- Name: 2729d38fb397
-- Type: 21

if mp.get_mpattribute("PACKED_WITH:(Base64)") and mp.getfilename():match(".dll") then
  return mp.INFECTED
end
return mp.CLEAN
