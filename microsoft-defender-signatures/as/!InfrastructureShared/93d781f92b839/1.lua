-- Threat: !InfrastructureShared
-- Name: 93d781f92b839
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
