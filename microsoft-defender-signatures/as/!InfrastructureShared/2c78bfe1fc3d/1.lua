-- Threat: !InfrastructureShared
-- Name: 2c78bfe1fc3d
-- Type: 21

if peattributes.lastscn_writable and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
