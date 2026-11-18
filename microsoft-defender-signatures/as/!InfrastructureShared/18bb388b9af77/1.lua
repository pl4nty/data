-- Threat: !InfrastructureShared
-- Name: 18bb388b9af77
-- Type: 21

if mp.IsKnownFriendlyFile(bm.get_imagepath(), true, true) == true then
  return mp.CLEAN
end
return mp.INFECTED
