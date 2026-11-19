-- Threat: !InfrastructureShared
-- Name: 1e29c999a73d
-- Type: 21

if mp.get_mpattribute("Nscript:Type_bat") then
  return mp.INFECTED
end
return mp.CLEAN
