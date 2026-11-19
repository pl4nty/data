-- Threat: !InfrastructureShared
-- Name: 3e178e9bd808e
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
