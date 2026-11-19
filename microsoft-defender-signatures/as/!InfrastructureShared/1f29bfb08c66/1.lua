-- Threat: !InfrastructureShared
-- Name: 1f29bfb08c66
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
