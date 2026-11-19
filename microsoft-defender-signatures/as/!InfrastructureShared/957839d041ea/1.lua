-- Threat: !InfrastructureShared
-- Name: 957839d041ea
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Win64/Trickbot.PA!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
