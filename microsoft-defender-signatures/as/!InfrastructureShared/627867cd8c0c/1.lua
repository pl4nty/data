-- Threat: !InfrastructureShared
-- Name: 627867cd8c0c
-- Type: 21

if mp.get_mpattribute("Clean:Cert:KLab") then
  return mp.CLEAN
end
return mp.INFECTED
