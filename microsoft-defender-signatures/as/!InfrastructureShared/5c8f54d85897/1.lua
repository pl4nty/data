-- Threat: !InfrastructureShared
-- Name: 5c8f54d85897
-- Type: 21

if string.lower(string.sub(mp.getfilename(), -3)) == "r2w" then
  return mp.CLEAN
end
return mp.INFECTED
