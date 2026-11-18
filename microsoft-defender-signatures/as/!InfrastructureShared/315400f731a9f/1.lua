-- Threat: !InfrastructureShared
-- Name: 315400f731a9f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
