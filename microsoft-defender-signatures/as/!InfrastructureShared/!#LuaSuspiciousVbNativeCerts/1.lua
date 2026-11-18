-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousVbNativeCerts
-- Type: 10
-- MpAttributes: pea_isvbnative & LoD:VBStudyExpensiveLoops & HSTR:VB.SuspiciousCrypter.CallbackImport

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil or #l_0_0 == 0 then
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3 = l_0_2.Certificates
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6 = l_0_5.Issuer
      if l_0_6 ~= nil and l_0_6.Organization ~= nil then
        local l_0_7 = {
          ["Microsoft Corporation"] = true,
          ["ROBLOX Corporation"] = true,
          ["AddTrust AB"] = true,
          ["Adobe Systems Incorporated"] = true,
          ["Dell USA L.P."] = true,
          ["DigiCert Inc"] = true,
          DigiCert = true,
          ["VeriSign, Inc."] = true,
          ["VeriSign Trust Network"] = true,
          ["COMODO CA Limited"] = true,
          Thawte = true,
          ["Thawte Consulting (Pty) Ltd."] = true,
          ["Symantec Corporation"] = true,
          ["WIZVERA CO., LTD"] = true,
          ["NCH Software"] = true,
          ["win.rar GmbH"] = true,
          Interezen = true,
          ["Interezen Co.,Ltd"] = true,
          ["Interezen Co,.Ltd"] = true,
          ["Shenzhen Wondershare Information Technology Co., Ltd."] = true,
          ["Reloaded Games, Inc"] = true
        }
        if l_0_7[mp.utf16to8(l_0_6.Organization)] then
          return mp.CLEAN
        end
      end
    end
  end
end
return mp.INFECTED
