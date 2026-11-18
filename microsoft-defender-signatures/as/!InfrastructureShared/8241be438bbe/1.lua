-- Threat: !InfrastructureShared
-- Name: 8241be438bbe
-- Type: 21

if sigattr_tail[mp.SIGATTR_LOG_SZ].matched == true and sigattr_tail[mp.SIGATTR_LOG_SZ].attribute == 12352 then
  return mp.INFECTED
end
return mp.CLEAN
