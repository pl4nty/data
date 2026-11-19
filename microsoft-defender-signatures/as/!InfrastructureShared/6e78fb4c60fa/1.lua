-- Threat: !InfrastructureShared
-- Name: 6e78fb4c60fa
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
