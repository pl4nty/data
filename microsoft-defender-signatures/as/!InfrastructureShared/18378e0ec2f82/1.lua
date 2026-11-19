-- Threat: !InfrastructureShared
-- Name: 18378e0ec2f82
-- Type: 21

if peattributes.reads_vdll_code then
  return mp.INFECTED
end
return mp.CLEAN
