-- Threat: !InfrastructureShared
-- Name: 71789ab4b2ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
