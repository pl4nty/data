-- Threat: !InfrastructureShared
-- Name: 5f78384e77a1
-- Type: 21

local l_0_0 = pehdr.NumberOfSections
if peattributes.isexe == true and pehdr.AddressOfEntryPoint >= pesecs[l_0_0].VirtualAddress and pesecs[l_0_0].Characteristics == 3758096448 and 3 < l_0_0 and mp.get_mpattribute("pea_no_security") then
  local l_0_1 = mp.GetCertificateInfo()
  for l_0_2, l_0_3 in pairs(l_0_1) do
    if l_0_3.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
