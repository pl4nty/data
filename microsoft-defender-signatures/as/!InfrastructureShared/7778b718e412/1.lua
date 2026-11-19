-- Threat: !InfrastructureShared
-- Name: 7778b718e412
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
