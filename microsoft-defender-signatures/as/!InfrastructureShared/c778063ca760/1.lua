-- Threat: !InfrastructureShared
-- Name: c778063ca760
-- Type: 21

if peattributes.isexe == true then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  local l_0_3 = mp.getfilesize()
  if 3000000 < l_0_3 then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
