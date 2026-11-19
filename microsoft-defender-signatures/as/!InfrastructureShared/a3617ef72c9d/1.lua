-- Threat: !InfrastructureShared
-- Name: a3617ef72c9d
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.ismsil == false then
  return mp.INFECTED
end
return mp.CLEAN
