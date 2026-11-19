-- Threat: !InfrastructureShared
-- Name: 1c6292d16f604
-- Type: 21

if mp.get_mpattribute("!SCRIPT:PHPHeaderTag.A") then
  return mp.INFECTED
end
return mp.CLEAN
