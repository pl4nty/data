-- Threat: !InfrastructureShared
-- Name: d8bf950bed5d
-- Type: 21

if mp.get_mpattribute("BM_JAVA_CLASS_FILE") then
  return mp.INFECTED
end
return mp.CLEAN
