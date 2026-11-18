-- Threat: !InfrastructureShared
-- Name: 2a784b2986c5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
