-- Threat: !InfrastructureShared
-- Name: 7078769d24e2
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0, l_0_1 = pe.get_imports()
  if 5 < l_0_0 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
