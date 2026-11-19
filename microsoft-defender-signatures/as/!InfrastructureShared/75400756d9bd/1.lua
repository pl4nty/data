-- Threat: !InfrastructureShared
-- Name: 75400756d9bd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
