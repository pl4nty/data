-- Threat: !InfrastructureShared
-- Name: 21d0e86d4862
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
