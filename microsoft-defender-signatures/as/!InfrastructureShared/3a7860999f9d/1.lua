-- Threat: !InfrastructureShared
-- Name: 3a7860999f9d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
