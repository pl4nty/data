-- Threat: !InfrastructureShared
-- Name: 62291408beb2
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
