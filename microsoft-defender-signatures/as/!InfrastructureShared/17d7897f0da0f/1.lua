-- Threat: !InfrastructureShared
-- Name: 17d7897f0da0f
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
