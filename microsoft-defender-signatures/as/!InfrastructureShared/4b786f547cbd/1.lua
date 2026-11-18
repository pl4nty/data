-- Threat: !InfrastructureShared
-- Name: 4b786f547cbd
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
