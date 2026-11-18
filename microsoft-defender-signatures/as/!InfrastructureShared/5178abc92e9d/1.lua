-- Threat: !InfrastructureShared
-- Name: 5178abc92e9d
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
