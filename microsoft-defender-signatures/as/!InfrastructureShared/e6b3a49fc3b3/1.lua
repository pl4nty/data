-- Threat: !InfrastructureShared
-- Name: e6b3a49fc3b3
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), false, false) == true then
  return mp.CLEAN
end
return mp.INFECTED
