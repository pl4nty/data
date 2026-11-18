-- Threat: !InfrastructureShared
-- Name: 3d29ee60dead
-- Type: 21

if mp.get_mpattribute("SCPT:HTMLFile") then
  return mp.INFECTED
end
return mp.CLEAN
