-- Threat: !InfrastructureShared
-- Name: 9729d6d29b56
-- Type: 21

if mp.getfilename():lower():match("\\poc.js$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
