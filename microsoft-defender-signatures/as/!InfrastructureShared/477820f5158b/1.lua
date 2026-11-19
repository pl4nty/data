-- Threat: !InfrastructureShared
-- Name: 477820f5158b
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true then
  return mp.INFECTED
end
return mp.CLEAN
