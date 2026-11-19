-- Threat: !InfrastructureShared
-- Name: ff784eda1026
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
