local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = GetRollingQueueKeyValue
L1_1 = "spPatchFound"
L2_1 = "true"
L0_1 = L0_1(L1_1, L2_1)
L1_1 = GetRollingQueueKeyValue
L2_1 = "spPatchNotFound"
L3_1 = "true"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= nil and L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:spPatchNotFound"
  L2_1(L3_1)
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
if L0_1 == nil then
  L2_1 = "spPatchFound"
  L3_1 = "spPatchNotFound"
  L4_1 = 1209600
  L5_1 = 86400
  L6_1 = nil
  L7_1 = pcall
  L8_1 = mp
  L8_1 = L8_1.get_contextdata
  L9_1 = mp
  L9_1 = L9_1.CONTEXT_DATA_AMSI_APPNAME
  L7_1, L8_1 = L7_1(L8_1, L9_1)
  if L7_1 and L8_1 then
    if L8_1 == "SharePoint Server 2016" then
      L6_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{CB3B172E-6212-49D6-9506-E168C7ECBF4F}"
    elseif L8_1 == "SharePoint Server 2019" then
      L6_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{ED506CD0-5B99-4B7C-9CDE-24A7F0DC5A1F}"
    elseif L8_1 == "SharePoint Server Subscription Edition" then
      L6_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{72B35D09-BBE4-40A7-B3BF-FDC1B556C305}"
    end
  end
  if L6_1 ~= nil then
    L9_1 = sysio
    L9_1 = L9_1.RegOpenKey
    L10_1 = L6_1
    L9_1 = L9_1(L10_1)
    if L9_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "Lua:spPatchFound"
      L10_1(L11_1)
      L10_1 = AppendToRollingQueue
      L11_1 = L2_1
      L12_1 = "true"
      L13_1 = "EmergencyGUID"
      L14_1 = L4_1
      L10_1(L11_1, L12_1, L13_1, L14_1)
      L10_1 = mp
      L10_1 = L10_1.CLEAN
      return L10_1
    end
  end
  L9_1 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  L10_1 = sysio
  L10_1 = L10_1.RegOpenKey
  L11_1 = L9_1
  L10_1 = L10_1(L11_1)
  if not L10_1 then
    L11_1 = mp
    L11_1 = L11_1.CLEAN
    return L11_1
  end
  L11_1 = sysio
  L11_1 = L11_1.RegEnumKeys
  L12_1 = L10_1
  L11_1 = L11_1(L12_1)
  if not L11_1 then
    L12_1 = mp
    L12_1 = L12_1.CLEAN
    return L12_1
  end
  L12_1 = nil
  L13_1 = nil
  L14_1 = nil
  L15_1 = nil
  L16_1 = nil
  L17_1 = pairs
  L18_1 = L11_1
  L17_1, L18_1, L19_1 = L17_1(L18_1)
  for L20_1, L21_1 in L17_1, L18_1, L19_1 do
    L22_1 = string
    L22_1 = L22_1.find
    L23_1 = L21_1
    L24_1 = "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{"
    L25_1 = 1
    L26_1 = true
    L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
    if L22_1 then
      L22_1 = sysio
      L22_1 = L22_1.RegOpenKey
      L23_1 = L9_1
      L24_1 = "\\"
      L25_1 = L21_1
      L23_1 = L23_1 .. L24_1 .. L25_1
      L22_1 = L22_1(L23_1)
      L12_1 = L22_1
      if L12_1 then
        L22_1 = sysio
        L22_1 = L22_1.GetRegValueAsString
        L23_1 = L12_1
        L24_1 = "DisplayName"
        L22_1 = L22_1(L23_1, L24_1)
        if not L22_1 then
          L23_1 = mp
          L23_1 = L23_1.CLEAN
          return L23_1
        end
        L24_1 = L22_1
        L23_1 = L22_1.match
        L25_1 = "%([Kk][Bb](%d+)%)"
        L23_1 = L23_1(L24_1, L25_1)
        if not L23_1 then
          L24_1 = mp
          L24_1 = L24_1.CLEAN
          return L24_1
        end
        L24_1 = tonumber
        L25_1 = L23_1
        L24_1 = L24_1(L25_1)
        L16_1 = L24_1
        L13_1 = true
        break
      else
        L22_1 = mp
        L22_1 = L22_1.set_mpattribute
        L23_1 = "Lua:spPatchQueryError"
        L22_1(L23_1)
        L22_1 = mp
        L22_1 = L22_1.CLEAN
        return L22_1
      end
    else
      L22_1 = string
      L22_1 = L22_1.find
      L23_1 = L21_1
      L24_1 = "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{"
      L25_1 = 1
      L26_1 = true
      L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
      if L22_1 then
        L22_1 = sysio
        L22_1 = L22_1.RegOpenKey
        L23_1 = L9_1
        L24_1 = "\\"
        L25_1 = L21_1
        L23_1 = L23_1 .. L24_1 .. L25_1
        L22_1 = L22_1(L23_1)
        L12_1 = L22_1
        if L12_1 then
          L22_1 = sysio
          L22_1 = L22_1.GetRegValueAsString
          L23_1 = L12_1
          L24_1 = "DisplayVersion"
          L22_1 = L22_1(L23_1, L24_1)
          L0_1 = L22_1
          if not L0_1 then
            L22_1 = mp
            L22_1 = L22_1.CLEAN
            return L22_1
          end
          L22_1 = string
          L22_1 = L22_1.gsub
          L23_1 = L0_1
          L24_1 = "%."
          L25_1 = ""
          L22_1 = L22_1(L23_1, L24_1, L25_1)
          L0_1 = L22_1
          L22_1 = tonumber
          L23_1 = L0_1
          L22_1 = L22_1(L23_1)
          L16_1 = L22_1
          L14_1 = true
          break
        else
          L22_1 = mp
          L22_1 = L22_1.set_mpattribute
          L23_1 = "Lua:spPatchQueryError"
          L22_1(L23_1)
          L22_1 = mp
          L22_1 = L22_1.CLEAN
          return L22_1
        end
      else
        L22_1 = string
        L22_1 = L22_1.find
        L23_1 = L21_1
        L24_1 = "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{"
        L25_1 = 1
        L26_1 = true
        L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
        if L22_1 then
          L22_1 = sysio
          L22_1 = L22_1.RegOpenKey
          L23_1 = L9_1
          L24_1 = "\\"
          L25_1 = L21_1
          L23_1 = L23_1 .. L24_1 .. L25_1
          L22_1 = L22_1(L23_1)
          L12_1 = L22_1
          if L12_1 then
            L22_1 = sysio
            L22_1 = L22_1.GetRegValueAsString
            L23_1 = L12_1
            L24_1 = "DisplayVersion"
            L22_1 = L22_1(L23_1, L24_1)
            L0_1 = L22_1
            if not L0_1 then
              L22_1 = mp
              L22_1 = L22_1.CLEAN
              return L22_1
            end
            L22_1 = string
            L22_1 = L22_1.gsub
            L23_1 = L0_1
            L24_1 = "%."
            L25_1 = ""
            L22_1 = L22_1(L23_1, L24_1, L25_1)
            L0_1 = L22_1
            L22_1 = tonumber
            L23_1 = L0_1
            L22_1 = L22_1(L23_1)
            L16_1 = L22_1
            L15_1 = true
            break
          else
            L22_1 = mp
            L22_1 = L22_1.set_mpattribute
            L23_1 = "Lua:spPatchQueryError"
            L22_1(L23_1)
            L22_1 = mp
            L22_1 = L22_1.CLEAN
            return L22_1
          end
        end
      end
    end
  end
  if L13_1 and L16_1 then
    if 5002760 <= L16_1 then
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L2_1
      L19_1 = "true"
      L20_1 = L0_1
      L21_1 = L4_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    else
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchNotFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L3_1
      L19_1 = "true"
      L20_1 = "NoPatch"
      L21_1 = L5_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    end
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
  if L14_1 and L16_1 then
    if 1601041720037 <= L16_1 then
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L2_1
      L19_1 = "true"
      L20_1 = L0_1
      L21_1 = L4_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    else
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchNotFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L3_1
      L19_1 = "true"
      L20_1 = "NoPatch"
      L21_1 = L5_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    end
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
  if L15_1 and L16_1 then
    if 1601852620508 <= L16_1 then
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L2_1
      L19_1 = "true"
      L20_1 = L0_1
      L21_1 = L4_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    else
      L17_1 = mp
      L17_1 = L17_1.set_mpattribute
      L18_1 = "Lua:spPatchNotFound"
      L17_1(L18_1)
      L17_1 = AppendToRollingQueue
      L18_1 = L3_1
      L19_1 = "true"
      L20_1 = "NoPatch"
      L21_1 = L5_1
      L17_1(L18_1, L19_1, L20_1, L21_1)
    end
    L17_1 = mp
    L17_1 = L17_1.CLEAN
    return L17_1
  end
else
  L2_1 = mp
  L2_1 = L2_1.set_mpattribute
  L3_1 = "Lua:spPatchFound"
  L2_1(L3_1)
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
