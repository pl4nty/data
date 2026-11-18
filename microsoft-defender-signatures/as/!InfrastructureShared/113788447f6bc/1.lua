-- Threat: !InfrastructureShared
-- Name: 113788447f6bc
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
