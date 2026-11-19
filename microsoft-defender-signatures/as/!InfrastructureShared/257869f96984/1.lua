-- Threat: !InfrastructureShared
-- Name: 257869f96984
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
