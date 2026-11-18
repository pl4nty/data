-- Threat: !InfrastructureShared
-- Name: 81780a28d7a9
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
