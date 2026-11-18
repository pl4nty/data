-- Threat: !InfrastructureShared
-- Name: dc613bf852be
-- Type: 21

if peattributes.isexe == true and peattributes.isvbnative == true then
  return mp.INFECTED
end
return mp.CLEAN
