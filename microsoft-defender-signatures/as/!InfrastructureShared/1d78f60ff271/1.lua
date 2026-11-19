-- Threat: !InfrastructureShared
-- Name: 1d78f60ff271
-- Type: 21

if pehdr.Machine == 34404 and pehdr.Subsystem == 1 and peattributes.isdriver and mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 100000 then
    return mp.INFECTED
  end
end
return mp.CLEAN
