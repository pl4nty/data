-- Threat: !InfrastructureShared
-- Name: 2a7870185b58
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
