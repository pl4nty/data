-- Threat: !InfrastructureShared
-- Name: 13ab3c1d75185
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
