-- Threat: !InfrastructureShared
-- Name: 3b297630e5f3
-- Type: 21

if string.find(mp.getfilename(), "->(Rtf", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED
