-- Threat: !InfrastructureShared
-- Name: 107299d294df6
-- Type: 21

if mp.get_mpattribute("SCPT:VBSCreateObject") and mp.getfilesize() < 10240 then
  return mp.INFECTED
end
return mp.CLEAN
