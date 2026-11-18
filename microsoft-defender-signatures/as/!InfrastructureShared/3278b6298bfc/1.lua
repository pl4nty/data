-- Threat: !InfrastructureShared
-- Name: 3278b6298bfc
-- Type: 21

if peattributes.x86_image == true and mp.getfilesize() < 8000000 and mp.getfilesize() > 6000000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
