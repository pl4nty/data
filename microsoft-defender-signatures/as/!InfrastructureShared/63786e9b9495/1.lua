-- Threat: !InfrastructureShared
-- Name: 63786e9b9495
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("NID:Trojan:MSIL/AgentTesla") then
  return mp.INFECTED
end
return mp.CLEAN
