-- Threat: !InfrastructureShared
-- Name: 39783e230577
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
