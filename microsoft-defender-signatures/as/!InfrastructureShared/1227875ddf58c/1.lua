-- Threat: !InfrastructureShared
-- Name: 1227875ddf58c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
