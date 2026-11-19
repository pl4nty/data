-- Threat: !InfrastructureShared
-- Name: 227806ebca0c
-- Type: 21

if mp.get_mpattribute("pea_no_security") and peattributes.isdll == true and peattributes.hasexports and peattributes.no_imports then
  local l_0_0 = mp.getfilesize()
  if 80000 <= l_0_0 and l_0_0 <= 250000 then
    return mp.INFECTED
  end
end
return mp.CLEAN
