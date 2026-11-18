-- Threat: !InfrastructureShared
-- Name: 597881340af2
-- Type: 21

if peattributes.isdll == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
