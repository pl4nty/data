-- Threat: !InfrastructureShared
-- Name: ba78928b8e75
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
