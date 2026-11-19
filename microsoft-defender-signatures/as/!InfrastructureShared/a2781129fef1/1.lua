-- Threat: !InfrastructureShared
-- Name: a2781129fef1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
