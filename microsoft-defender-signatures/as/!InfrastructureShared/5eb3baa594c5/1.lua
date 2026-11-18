-- Threat: !InfrastructureShared
-- Name: 5eb3baa594c5
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
