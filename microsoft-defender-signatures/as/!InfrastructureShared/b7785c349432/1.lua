-- Threat: !InfrastructureShared
-- Name: b7785c349432
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 1500000 and mp.getfilesize() > 1000000 and (mp.get_mpattribute("NID:Trojan:Win64/Tedy.NT1!MTB") or mp.get_mpattribute("NID:Trojan:Win64/Tedy.NT2!MTB")) then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
