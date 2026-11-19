-- Threat: !InfrastructureShared
-- Name: 77780351eb5e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
