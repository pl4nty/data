-- Threat: !InfrastructureShared
-- Name: OldZbot
-- Type: 1

function Infrastructure_OldZbotIsOneXThread(l_1_0)
  return string.find(l_1_0, "PWS:Win32/Zbot.gen!Z", 1, true) ~= nil
end

function Infrastructure_OldZbotIsOneXCleanup(l_2_0)
  return string.find(l_2_0, "Zbot.gen!Z", 1, true) ~= nil or string.find(l_2_0, "Zbot.gen!AA", 1, true) ~= nil
end

function Infrastructure_OldZbotIsFullScanThreat(l_3_0)
  return string.match(l_3_0, "Virus:Win32/Zbot%.[BC]") ~= nil
end

function Infrastructure_OldZbotIsTwoXThread(l_4_0)
  return string.match(l_4_0, "PWS:Win32/Zbot%.gen!A[CDE]") ~= nil
end

function Infrastructure_OldZbotIsTwoXDetection(l_5_0)
  return string.find(l_5_0, "PWS:Win32/Zbot.gen!AI", 1, true) ~= nil
end

function Infrastructure_OldZbotScanWithAttribute(l_6_0, l_6_1)
  if type(l_6_0) ~= "string" or type(l_6_1) ~= "string" then
    return
  end
  MpCommon.SetGlobalMpAttribute(l_6_0)
  pcall(MpDetection.ScanResource, l_6_1)
  MpCommon.DeleteGlobalMpAttribute(l_6_0)
end

function Infrastructure_OldZbotExpandPaths(l_7_0, l_7_1)
  if type(l_7_0) ~= "string" then
    return {}
  end
  local l_7_2 = sysio.ExpandFilePath(l_7_0, l_7_1)
  if type(l_7_2) == "table" then
    return l_7_2
  end
  if type(l_7_2) == "string" then
    return {l_7_2}
  end
  return {}
end

function Infrastructure_OldZbotNormalizePathValue(l_8_0)
  local l_8_1 = string.match(l_8_0, "^%s*(.-)%s*$")
  if not l_8_1 or l_8_1 == "" then
    return nil
  end
  if string.sub(l_8_1, 1, 1) == "\"" then
    local l_8_2 = string.match(l_8_1, "^\"([^\"]+)\"")
    if l_8_2 then
      return l_8_2
    end
  end
  return l_8_1
end

local function l_0_0(l_9_0)
  if type(l_9_0) ~= "string" or not string.find(l_9_0, "pp.*ata\\") then
    return nil
  end
  local l_9_1
  for l_9_2 in string.gmatch(l_9_0, "[^\"]+") do
    local l_9_3, l_9_4 = string.match(l_9_2, "ata\\([a-zA-Z]+)\\([a-zA-Z]+)%.exe")
    if l_9_3 and l_9_4 and 3 <= #l_9_3 and #l_9_3 <= 12 and 3 <= #l_9_4 and #l_9_4 <= 12 then
      l_9_1 = l_9_2
    end
  end
  return l_9_1
end

function Infrastructure_OldZbotGetTwoXCandidates()
  local l_10_0 = {}
  local l_10_1 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
  if type(l_10_1) ~= "table" then
    return l_10_0
  end
  for l_10_2, l_10_3 in pairs(l_10_1) do
    if type(l_10_3) == "string" then
      local l_10_4 = sysio.RegOpenKey(l_10_3)
      if l_10_4 then
        local l_10_5 = sysio.RegEnumValues(l_10_4)
        if type(l_10_5) == "table" then
          for l_10_6, l_10_7 in pairs(l_10_5) do
            if type(l_10_7) == "string" and string.find(l_10_7, "%{[0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F][0-9A-F]%-") then
              local l_10_8 = sysio.GetRegValueAsString(l_10_4, l_10_7)
              local l_10_9 = l_0_0(l_10_8)
              if l_10_9 then
                l_10_0[#l_10_0 + 1] = {
                  path = l_10_9,
                  run_key_name = l_10_3,
                  value_name = l_10_7
                }
              end
            end
          end
        end
      end
    end
  end
  return l_10_0
end
