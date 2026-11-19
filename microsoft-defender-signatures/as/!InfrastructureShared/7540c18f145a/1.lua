-- Threat: !InfrastructureShared
-- Name: 7540c18f145a
-- Type: 21

if mp.getfilesize() > 61440 then
  return mp.CLEAN
end
return mp.INFECTED
