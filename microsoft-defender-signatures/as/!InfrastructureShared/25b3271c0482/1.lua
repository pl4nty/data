-- Threat: !InfrastructureShared
-- Name: 25b3271c0482
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
