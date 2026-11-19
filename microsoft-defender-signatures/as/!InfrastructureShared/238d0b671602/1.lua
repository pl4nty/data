-- Threat: !InfrastructureShared
-- Name: 238d0b671602
-- Type: 21

if mp.get_mpattribute("MpCodeSignatureOffset") then
  return mp.CLEAN
end
return mp.INFECTED
