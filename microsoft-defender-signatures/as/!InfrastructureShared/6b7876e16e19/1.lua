-- Threat: !InfrastructureShared
-- Name: 6b7876e16e19
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and pesecs[11].Characteristics == 3758096480 then
  return mp.INFECTED
end
return mp.CLEAN
