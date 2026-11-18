-- Threat: !InfrastructureShared
-- Name: 55789d4b1943
-- Type: 21

if mp.get_mpattribute("SIGATTR:Trojan:MSIL/Zusy.RX!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
