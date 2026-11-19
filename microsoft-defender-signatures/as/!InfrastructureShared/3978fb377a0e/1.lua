-- Threat: !InfrastructureShared
-- Name: 3978fb377a0e
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
