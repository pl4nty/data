-- Threat: !InfrastructureShared
-- Name: bd781e8642eb
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
