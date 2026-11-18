-- Threat: !InfrastructureShared
-- Name: 12178f7993b32
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
