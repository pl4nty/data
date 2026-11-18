-- Threat: !InfrastructureShared
-- Name: fb78419079ca
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
