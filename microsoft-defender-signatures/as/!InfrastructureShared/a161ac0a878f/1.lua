-- Threat: !InfrastructureShared
-- Name: a161ac0a878f
-- Type: 21

if mp.get_mpattribute("HSTR:SkypeSneak") then
  return mp.INFECTED
end
return mp.CLEAN
