-- Threat: !InfrastructureShared
-- Name: 36785be65f90
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
