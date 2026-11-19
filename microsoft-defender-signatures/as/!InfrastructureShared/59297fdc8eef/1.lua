-- Threat: !InfrastructureShared
-- Name: 59297fdc8eef
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
