-- Threat: !InfrastructureShared
-- Name: 4178b17d706e
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
