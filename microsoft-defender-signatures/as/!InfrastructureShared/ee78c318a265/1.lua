-- Threat: !InfrastructureShared
-- Name: ee78c318a265
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 75000 and mp.getfilesize() < 78000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
end
return mp.INFECTED
