-- Threat: !InfrastructureShared
-- Name: 9878e4174530
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
