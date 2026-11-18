-- Threat: !InfrastructureShared
-- Name: 8278a13c6185
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
