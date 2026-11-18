-- Threat: !InfrastructureShared
-- Name: 40787f60a05b
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
