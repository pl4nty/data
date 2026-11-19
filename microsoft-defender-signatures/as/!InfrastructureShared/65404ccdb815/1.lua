-- Threat: !InfrastructureShared
-- Name: 65404ccdb815
-- Type: 21

if sigattr_head[1].attribute == 12363 and sigattr_tail[mp.SIGATTR_LOG_SZ].attribute == 12375 or sigattr_tail[mp.SIGATTR_LOG_SZ].attribute == 12381 then
  return mp.INFECTED
end
return mp.CLEAN
