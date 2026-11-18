-- Threat: !InfrastructureShared
-- Name: 67783102ed3d
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
