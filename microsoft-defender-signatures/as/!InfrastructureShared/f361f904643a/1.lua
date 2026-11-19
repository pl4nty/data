-- Threat: !InfrastructureShared
-- Name: f361f904643a
-- Type: 21

if mp.get_mpattribute("pea_suspicious_dosheader") then
  return mp.INFECTED
end
return mp.CLEAN
