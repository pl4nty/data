-- Threat: !InfrastructureShared
-- Name: dd78e74e3452
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if peattributes.isexe == true and pehdr.NumberOfSections == 7 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
