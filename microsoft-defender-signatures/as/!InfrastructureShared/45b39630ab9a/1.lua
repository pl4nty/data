-- Threat: !InfrastructureShared
-- Name: 45b39630ab9a
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
