-- Threat: !InfrastructureShared
-- Name: 15761f6474bcf
-- Type: 21

if hstrlog[1].hitcount > 2 then
  return mp.INFECTED
end
return mp.CLEAN
