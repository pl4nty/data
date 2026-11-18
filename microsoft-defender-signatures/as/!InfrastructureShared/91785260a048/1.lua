-- Threat: !InfrastructureShared
-- Name: 91785260a048
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
