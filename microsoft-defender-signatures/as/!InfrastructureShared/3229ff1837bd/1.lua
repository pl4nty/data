-- Threat: !InfrastructureShared
-- Name: 3229ff1837bd
-- Type: 21

if string.find(mp.getfilename(), "->(Rtf", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
