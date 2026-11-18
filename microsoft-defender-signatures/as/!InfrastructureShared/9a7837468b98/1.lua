-- Threat: !InfrastructureShared
-- Name: 9a7837468b98
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
