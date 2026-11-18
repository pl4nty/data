-- Threat: !InfrastructureShared
-- Name: 39781b41e17d
-- Type: 21

if mp.get_mpattribute("SIGATTR:ASEP") then
  return mp.INFECTED
end
return mp.CLEAN
