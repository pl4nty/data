-- Threat: !InfrastructureShared
-- Name: 9878d3edae0c
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
