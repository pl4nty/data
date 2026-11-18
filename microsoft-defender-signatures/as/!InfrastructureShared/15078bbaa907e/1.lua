-- Threat: !InfrastructureShared
-- Name: 15078bbaa907e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
