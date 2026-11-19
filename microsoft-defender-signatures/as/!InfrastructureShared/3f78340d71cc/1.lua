-- Threat: !InfrastructureShared
-- Name: 3f78340d71cc
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
