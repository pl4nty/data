-- Threat: !InfrastructureShared
-- Name: 7241cbc3994b
-- Type: 21

if sigattr_tail[mp.SIGATTR_LOG_SZ].matched == true and sigattr_tail[mp.SIGATTR_LOG_SZ].attribute == 12352 then
  return mp.INFECTED
end
return mp.CLEAN
