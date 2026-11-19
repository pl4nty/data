-- Threat: !InfrastructureShared
-- Name: 40781c174141
-- Type: 21

if not peattributes.has_msilresources then
  return mp.CLEAN
end
return mp.INFECTED
