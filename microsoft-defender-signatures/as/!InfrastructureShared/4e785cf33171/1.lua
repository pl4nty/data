-- Threat: !InfrastructureShared
-- Name: 4e785cf33171
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
