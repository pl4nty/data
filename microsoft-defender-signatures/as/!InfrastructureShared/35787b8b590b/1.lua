-- Threat: !InfrastructureShared
-- Name: 35787b8b590b
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
