-- Threat: !InfrastructureShared
-- Name: 45d01e53d072
-- Type: 21

if mp.get_mpattribute("SCRIPT:OlefileCheck") then
  return mp.INFECTED
end
return mp.CLEAN
