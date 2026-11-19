-- Threat: !InfrastructureShared
-- Name: !#Lua:GetSpPatchVer.A
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsSharePointAmsiScan & SCPT:ToolPane.A & SCPT:ToolPane.B

local l_0_0 = GetRollingQueueKeyValue("spPatchFound", "true")
local l_0_1 = GetRollingQueueKeyValue("spPatchNotFound", "true")
if l_0_1 ~= nil and l_0_0 == nil then
  mp.set_mpattribute("Lua:spPatchNotFound")
  return mp.CLEAN
end
if l_0_0 == nil then
  local l_0_2 = "spPatchFound"
  local l_0_3 = "spPatchNotFound"
  local l_0_4 = 1209600
  local l_0_5 = 86400
  local l_0_6
  local l_0_7, l_0_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_7 and l_0_8 then
    if l_0_8 == "SharePoint Server 2016" then
      l_0_6 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{CB3B172E-6212-49D6-9506-E168C7ECBF4F}"
    elseif l_0_8 == "SharePoint Server 2019" then
      l_0_6 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{ED506CD0-5B99-4B7C-9CDE-24A7F0DC5A1F}"
    elseif l_0_8 == "SharePoint Server Subscription Edition" then
      l_0_6 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{72B35D09-BBE4-40A7-B3BF-FDC1B556C305}"
    end
  end
  if l_0_6 ~= nil then
    local l_0_9 = sysio.RegOpenKey(l_0_6)
    if l_0_9 then
      mp.set_mpattribute("Lua:spPatchFound")
      AppendToRollingQueue(l_0_2, "true", "EmergencyGUID", l_0_4)
      return mp.CLEAN
    end
  end
  local l_0_10 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  local l_0_11 = sysio.RegOpenKey(l_0_10)
  if not l_0_11 then
    return mp.CLEAN
  end
  local l_0_12 = sysio.RegEnumKeys(l_0_11)
  if not l_0_12 then
    return mp.CLEAN
  end
  local l_0_13, l_0_14, l_0_15, l_0_16, l_0_17
  for l_0_18, l_0_19 in pairs(l_0_12) do
    if string.find(l_0_19, "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
      l_0_13 = sysio.RegOpenKey(l_0_10 .. "\\" .. l_0_19)
      if l_0_13 then
        local l_0_20 = sysio.GetRegValueAsString(l_0_13, "DisplayName")
        if not l_0_20 then
          return mp.CLEAN
        end
        local l_0_21 = l_0_20:match("%([Kk][Bb](%d+)%)")
        if not l_0_21 then
          return mp.CLEAN
        end
        l_0_17 = tonumber(l_0_21)
        l_0_14 = true
        break
      else
        mp.set_mpattribute("Lua:spPatchQueryError")
        return mp.CLEAN
      end
    elseif string.find(l_0_19, "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
      l_0_13 = sysio.RegOpenKey(l_0_10 .. "\\" .. l_0_19)
      if l_0_13 then
        l_0_0 = sysio.GetRegValueAsString(l_0_13, "DisplayVersion")
        if not l_0_0 then
          return mp.CLEAN
        end
        l_0_0 = string.gsub(l_0_0, "%.", "")
        l_0_17 = tonumber(l_0_0)
        l_0_15 = true
        break
      else
        mp.set_mpattribute("Lua:spPatchQueryError")
        return mp.CLEAN
      end
    elseif string.find(l_0_19, "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
      l_0_13 = sysio.RegOpenKey(l_0_10 .. "\\" .. l_0_19)
      if l_0_13 then
        l_0_0 = sysio.GetRegValueAsString(l_0_13, "DisplayVersion")
        if not l_0_0 then
          return mp.CLEAN
        end
        l_0_0 = string.gsub(l_0_0, "%.", "")
        l_0_17 = tonumber(l_0_0)
        l_0_16 = true
        break
      else
        mp.set_mpattribute("Lua:spPatchQueryError")
        return mp.CLEAN
      end
    end
  end
  if l_0_14 and l_0_17 then
    if 5002760 <= l_0_17 then
      mp.set_mpattribute("Lua:spPatchFound")
      AppendToRollingQueue(l_0_2, "true", l_0_0, l_0_4)
    else
      mp.set_mpattribute("Lua:spPatchNotFound")
      AppendToRollingQueue(l_0_3, "true", "NoPatch", l_0_5)
    end
    return mp.CLEAN
  end
  if l_0_15 and l_0_17 then
    if 1601041720037 <= l_0_17 then
      mp.set_mpattribute("Lua:spPatchFound")
      AppendToRollingQueue(l_0_2, "true", l_0_0, l_0_4)
    else
      mp.set_mpattribute("Lua:spPatchNotFound")
      AppendToRollingQueue(l_0_3, "true", "NoPatch", l_0_5)
    end
    return mp.CLEAN
  end
  if l_0_16 and l_0_17 then
    if 1601852620508 <= l_0_17 then
      mp.set_mpattribute("Lua:spPatchFound")
      AppendToRollingQueue(l_0_2, "true", l_0_0, l_0_4)
    else
      mp.set_mpattribute("Lua:spPatchNotFound")
      AppendToRollingQueue(l_0_3, "true", "NoPatch", l_0_5)
    end
    return mp.CLEAN
  end
else
  mp.set_mpattribute("Lua:spPatchFound")
end
return mp.CLEAN
