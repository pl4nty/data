-- Threat: !InfrastructureShared
-- Name: 52787d5ba9bd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
