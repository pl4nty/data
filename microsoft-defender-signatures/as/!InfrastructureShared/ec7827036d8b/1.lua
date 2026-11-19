-- Threat: !InfrastructureShared
-- Name: ec7827036d8b
-- Type: 21

if peattributes.isexe == true and peattributes.isvbnative == true then
  return mp.INFECTED
end
return mp.CLEAN
