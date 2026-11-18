-- Threat: !InfrastructureShared
-- Name: 6e6103761e05
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
