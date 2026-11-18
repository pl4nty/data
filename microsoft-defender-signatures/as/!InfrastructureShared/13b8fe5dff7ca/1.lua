-- Threat: !InfrastructureShared
-- Name: 13b8fe5dff7ca
-- Type: 21

if string.lower(string.sub(mp.getfilename(), -3)) == "r2w" then
  return mp.CLEAN
end
return mp.INFECTED
