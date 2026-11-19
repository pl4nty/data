-- Threat: !InfrastructureShared
-- Name: a9789a6ba63e
-- Type: 21

local l_0_0 = mp.GetCertificateInfo()
if peattributes.isdll == true and mp.getfilesize() >= 20000 and mp.getfilesize() <= 20200 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
