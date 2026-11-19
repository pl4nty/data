-- Threat: !InfrastructureShared
-- Name: 927811dbc2a4
-- Type: 21

if pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
