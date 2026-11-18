-- Threat: !InfrastructureShared
-- Name: 15b3c9c93cf6
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
