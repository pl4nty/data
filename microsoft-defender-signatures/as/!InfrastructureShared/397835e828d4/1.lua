-- Threat: !InfrastructureShared
-- Name: 397835e828d4
-- Type: 21

if pesecs[4].Name == ".imports" and pesecs[3].Name == "UPX2" and mp.getfilesize() > 60000 and mp.getfilesize() < 70000 then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
