-- Threat: !InfrastructureShared
-- Name: 887846773430
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
