-- Threat: !InfrastructureShared
-- Name: 9078adfe1fd1
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
