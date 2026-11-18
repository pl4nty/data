-- Threat: !InfrastructureShared
-- Name: !#LUA:PEAnomaly_CertificateExpired
-- Type: 10
-- MpAttributes: PEPCODE:HasDigitalSignature

local l_0_0 = mp.GetCertificateInfo()
local l_0_1, l_0_2, l_0_3 = MpCommon.GetDateFromTimeT(MpCommon.GetCurrentTimeT())
for l_0_4, l_0_5 in ipairs(l_0_0) do
  if l_0_5.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  local l_0_6 = l_0_5.Certificates
  if l_0_6 ~= nil then
    for l_0_7, l_0_8 in ipairs(l_0_6) do
      local l_0_9 = l_0_8.ValidTo
      if l_0_9 ~= nil then
        local l_0_10 = l_0_9.Year
        local l_0_11 = l_0_9.Month
        local l_0_12 = l_0_9.Day
        if l_0_3 > l_0_10 or l_0_10 == l_0_3 and l_0_2 > l_0_11 or l_0_10 == l_0_3 and l_0_11 == l_0_2 and l_0_1 > l_0_12 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
