-- Threat: !InfrastructureShared
-- Name: 27788f962992
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
