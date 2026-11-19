-- Threat: !InfrastructureShared
-- Name: 25b3608e38d4
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
