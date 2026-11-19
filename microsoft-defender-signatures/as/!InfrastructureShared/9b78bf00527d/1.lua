-- Threat: !InfrastructureShared
-- Name: 9b78bf00527d
-- Type: 21

if mp.get_mpattribute("RustLang.A1") then
  return mp.INFECTED
end
return mp.CLEAN
