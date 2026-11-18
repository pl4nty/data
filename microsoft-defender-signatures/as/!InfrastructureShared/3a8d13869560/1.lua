-- Threat: !InfrastructureShared
-- Name: 3a8d13869560
-- Type: 21

if mp.get_mpattribute("MpCodeSignatureOffset") then
  return mp.CLEAN
end
return mp.INFECTED
