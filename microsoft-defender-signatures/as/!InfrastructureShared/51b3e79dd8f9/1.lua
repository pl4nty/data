-- Threat: !InfrastructureShared
-- Name: 51b3e79dd8f9
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
