-- Threat: !InfrastructureShared
-- Name: 3e7829d299a4
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 160000 and mp.getfilesize() < 180000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_3 = pe.get_versioninfo()
if l_0_3 ~= nil and l_0_3.OriginalFilename == "sqlite" and l_0_3.product ~= "sqlite" and l_0_3.Description ~= "sqlite" then
  return mp.INFECTED
end
return mp.CLEAN
