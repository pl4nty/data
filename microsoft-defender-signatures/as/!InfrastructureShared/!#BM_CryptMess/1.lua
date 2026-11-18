-- Threat: !InfrastructureShared
-- Name: !#BM_CryptMess
-- Type: 13

if mp.get_mpattributesubstring("TEL:Ransom:HTML/") or mp.get_mpattributesubstring("TEL:Ransom:TXT/") then
  return mp.INFECTED
end
return mp.CLEAN
