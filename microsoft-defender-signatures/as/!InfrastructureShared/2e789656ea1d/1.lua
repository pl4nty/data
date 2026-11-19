-- Threat: !InfrastructureShared
-- Name: 2e789656ea1d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
