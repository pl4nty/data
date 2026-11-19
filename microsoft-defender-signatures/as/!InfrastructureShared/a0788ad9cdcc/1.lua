-- Threat: !InfrastructureShared
-- Name: a0788ad9cdcc
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
