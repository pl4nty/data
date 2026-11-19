-- Threat: !InfrastructureShared
-- Name: 5078dde5da8c
-- Type: 21

if peattributes.isdll == true and peattributes.hasexports == true and pehdr.AddressOfEntryPoint == 4592 and pehdr.Machine == 34404 and mp.getfilesize() < 1900000 and mp.getfilesize() > 1000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
