-- Threat: !InfrastructureShared
-- Name: 3e2915ad2a43
-- Type: 21

if mp.get_mpattribute("//RPF:IS_Pdf") then
  return mp.INFECTED
end
return mp.CLEAN
