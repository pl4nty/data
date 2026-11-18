-- Threat: !InfrastructureShared
-- Name: 962922ccbe0b
-- Type: 21

if mp.get_mpattribute("SCRIPT:PHPHeaderTag.A") and mp.getfilesize() < 1024 then
  return mp.INFECTED
end
return mp.CLEAN
