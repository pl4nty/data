-- Threat: !InfrastructureShared
-- Name: !#PUA:Win32/Creprote
-- Type: 13

if mp.get_mpattributesubstring("PUA:ML:Staged:") then
  mp.set_mpattribute("PUA:Staged:CertificatesGBL")
end
if mp.get_mpattributesubstring("PUA:ML:Blocked:") then
  mp.set_mpattribute("PUA:Blocked:Certificates")
end
if mp.get_mpattributesubstring("PUA:Block:") then
  mp.set_mpattribute("PUA:Blocked:Signature")
end
return mp.CLEAN
