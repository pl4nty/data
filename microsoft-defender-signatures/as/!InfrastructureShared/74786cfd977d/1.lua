-- Threat: !InfrastructureShared
-- Name: 74786cfd977d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
