-- Threat: !InfrastructureShared
-- Name: 967824d226be
-- Type: 21

if string.lower(pe.get_versioninfo().ProductName) == "zoomify plug-in for internet explorer" then
  return mp.INFECTED
end
return mp.CLEAN
