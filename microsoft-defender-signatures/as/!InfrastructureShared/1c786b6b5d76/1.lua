-- Threat: !InfrastructureShared
-- Name: 1c786b6b5d76
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 150000 and mp.getfilesize() < 250000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
local l_0_3 = pe.get_versioninfo()
if l_0_3 ~= nil and l_0_3.OriginalFilename == "libcurl" and l_0_3.product ~= "The curl library" and l_0_3.Copyright ~= "Daniel Stenberg" then
  return mp.INFECTED
end
return mp.CLEAN
