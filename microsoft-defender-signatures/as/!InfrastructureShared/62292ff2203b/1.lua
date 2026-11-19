-- Threat: !InfrastructureShared
-- Name: 62292ff2203b
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
