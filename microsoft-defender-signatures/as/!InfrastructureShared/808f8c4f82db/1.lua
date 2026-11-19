-- Threat: !InfrastructureShared
-- Name: 808f8c4f82db
-- Type: 21

if mp.get_mpattribute("MHSTR:MacroExecute") then
  return mp.INFECTED
end
return mp.CLEAN
