-- Threat: !InfrastructureShared
-- Name: 3e782f1d6cc4
-- Type: 21

if mp.get_mpattribute("RktProtect.pdb") and peattributes.isdriver then
  return mp.INFECTED
end
return mp.CLEAN
