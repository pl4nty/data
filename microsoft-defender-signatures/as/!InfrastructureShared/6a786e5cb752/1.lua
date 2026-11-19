-- Threat: !InfrastructureShared
-- Name: 6a786e5cb752
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
