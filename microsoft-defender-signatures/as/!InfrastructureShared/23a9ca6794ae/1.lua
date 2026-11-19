-- Threat: !InfrastructureShared
-- Name: 23a9ca6794ae
-- Type: 21

if nri.IsResponse() == false then
  return mp.INFECTED
end
return mp.CLEAN
