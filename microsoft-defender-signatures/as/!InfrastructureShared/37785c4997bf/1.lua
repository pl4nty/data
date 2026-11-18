-- Threat: !InfrastructureShared
-- Name: 37785c4997bf
-- Type: 21

if peattributes.executes_from_dynamic_memory and peattributes.x86_image and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
