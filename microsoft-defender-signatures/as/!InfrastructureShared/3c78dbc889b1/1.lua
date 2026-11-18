-- Threat: !InfrastructureShared
-- Name: 3c78dbc889b1
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
