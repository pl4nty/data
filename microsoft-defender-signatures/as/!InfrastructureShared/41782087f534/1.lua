-- Threat: !InfrastructureShared
-- Name: 41782087f534
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
