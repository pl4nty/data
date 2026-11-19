-- Threat: !InfrastructureShared
-- Name: 6778c3cfe740
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
