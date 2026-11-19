-- Threat: !InfrastructureShared
-- Name: 15b3d1189f2f
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
