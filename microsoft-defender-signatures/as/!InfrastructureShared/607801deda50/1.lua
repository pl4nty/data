-- Threat: !InfrastructureShared
-- Name: 607801deda50
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
