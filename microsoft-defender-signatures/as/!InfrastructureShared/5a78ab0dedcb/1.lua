-- Threat: !InfrastructureShared
-- Name: 5a78ab0dedcb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
