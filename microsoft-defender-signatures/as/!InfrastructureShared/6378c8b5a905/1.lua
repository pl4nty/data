-- Threat: !InfrastructureShared
-- Name: 6378c8b5a905
-- Type: 21

if peattributes.isexe then
  if mp.getfilesize() > 2300000 and mp.getfilesize() < 3200000 then
    local l_0_0 = mp.GetCertificateInfo()
    for l_0_1, l_0_2 in pairs(l_0_0) do
      if l_0_2.Signers ~= nil then
        return mp.CLEAN
      end
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end
return mp.CLEAN
