-- Threat: !InfrastructureShared
-- Name: 2578e9f47118
-- Type: 21

if peattributes.is_process then
  return mp.CLEAN
end
if not mp.get_mpattribute("HSTR:Win32/Zusy.HAC4!MTB") then
  return mp.CLEAN
end
if peattributes.no_security and peattributes.isdll then
  local l_0_0 = mp.GetCertificateInfo()
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if l_0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
