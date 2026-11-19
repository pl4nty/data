-- Threat: !InfrastructureShared
-- Name: 6778a3838b6f
-- Type: 21

if pehdr.Magic == 523 then
  return mp.INFECTED
end
return mp.CLEAN
