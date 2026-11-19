-- Threat: !InfrastructureShared
-- Name: !#Lua:CertValidFromRecent
-- Type: 9

local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil or #l_0_0 == 0 then
  if string.find(mp.getfilename(), "->") == nil then
    mp.set_mpattribute("Lua:TopLevelUnsigned")
  end
  return mp.CLEAN
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2.AuthenticodeContentType ~= "PE" then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.Certificates
  if l_0_3 ~= nil then
    for l_0_4, l_0_5 in ipairs(l_0_3) do
      local l_0_6 = "20160501"
      local l_0_7 = l_0_5.ValidFrom
      if l_0_7 ~= nil then
        local l_0_8 = l_0_7.Year
        if string.len(l_0_7.Month) < 2 then
          l_0_8 = l_0_8 .. "0"
        end
        l_0_8 = l_0_8 .. l_0_7.Month
        if 2 > string.len(l_0_7.Day) then
          l_0_8 = l_0_8 .. "0"
        end
        l_0_8 = l_0_8 .. l_0_7.Day
        if l_0_6 < l_0_8 then
          local l_0_9 = false
          local l_0_10 = l_0_5.Issuer
          if l_0_10 ~= nil and l_0_10.Organization ~= nil and mp.utf16to8(l_0_10.Organization) == "Microsoft Corporation" then
            l_0_9 = true
          end
          if l_0_9 then
            if l_0_7.Year > 2024 and l_0_10.CommonName ~= nil then
              local l_0_11 = mp.utf16to8(l_0_10.CommonName)
              if l_0_11 ~= nil and 31 < #l_0_11 and (string.sub(l_0_11, 1, 31) == "Microsoft ID Verified CS AOC CA" or string.sub(l_0_11, 1, 31) == "Microsoft ID Verified CS EOC CA") then
                mp.set_mpattribute("Lua:MSAzureSigningCertValidFromRecent")
              end
            end
          else
            mp.set_mpattribute("Lua:CertValidFromRecent")
            local l_0_12 = l_0_5.Subject
            if l_0_12 ~= nil and l_0_12.Country ~= nil and string.len(l_0_12.Country) < 20 then
              local l_0_13 = mp.utf16to8(l_0_12.Country)
              if l_0_13 ~= nil then
                mp.set_mpattribute("Lua:CertValidFromRecentCountry" .. l_0_13)
              end
            end
            return mp.CLEAN
          end
        end
      end
      local l_0_14 = l_0_5.ValidTo
      if l_0_14 ~= nil and l_0_7 ~= nil then
        local l_0_15 = l_0_14.Year
        if string.len(l_0_14.Month) < 2 then
          l_0_15 = l_0_15 .. "0"
        end
        l_0_15 = l_0_15 .. l_0_14.Month
        if 2 > string.len(l_0_14.Day) then
          l_0_15 = l_0_15 .. "0"
        end
        l_0_15 = l_0_15 .. l_0_14.Day
        if l_0_6 > l_0_15 then
          local l_0_16 = false
          local l_0_17 = false
          local l_0_18 = l_0_5.Issuer
          if l_0_18 ~= nil then
            if l_0_18.Organization ~= nil and mp.utf16to8(l_0_18.Organization) == "Microsoft Corporation" then
              l_0_16 = true
            end
            if l_0_18.CommonName ~= nil and mp.utf16to8(l_0_18.CommonName) == "Unknown issuer" then
              l_0_17 = true
            end
          end
          local l_0_19 = false
          local l_0_20 = l_0_5.Subject
          if l_0_20 ~= nil and l_0_20.Organization ~= nil then
            local l_0_21 = {
              ["Microsoft Corporation"] = true,
              ["ROBLOX Corporation"] = true,
              ["Adobe Systems Incorporated"] = true,
              ["Dell USA L.P."] = true,
              ["DigiCert Inc"] = true,
              DigiCert = true,
              ["VeriSign, Inc."] = true,
              ["VeriSign Trust Network"] = true,
              ["COMODO CA Limited"] = true,
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
            if l_0_21[mp.utf16to8(l_0_20.Organization)] then
              l_0_19 = true
            end
          end
          if not l_0_16 and not l_0_19 and not l_0_17 then
            mp.set_mpattribute("Lua:CertValidToOld")
            return mp.CLEAN
          end
        end
      end
    end
  end
end
return mp.CLEAN
