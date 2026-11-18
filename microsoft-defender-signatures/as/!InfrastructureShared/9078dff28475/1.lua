-- Threat: !InfrastructureShared
-- Name: 9078dff28475
-- Type: 21

if peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
