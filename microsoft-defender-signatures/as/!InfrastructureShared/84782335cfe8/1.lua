-- Threat: !InfrastructureShared
-- Name: 84782335cfe8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and pesecs[11].Characteristics == 3758096480 then
  return mp.INFECTED
end
return mp.CLEAN
