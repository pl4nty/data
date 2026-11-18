-- Threat: !InfrastructureShared
-- Name: 13cb3e8ee8083
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[5].utf8p2))
else
  return mp.CLEAN
end

local function l_0_1(l_1_0)
  local l_1_1 = {}
  for l_1_2 in string.gmatch(l_1_0, "[^%s]+") do
    table.insert(l_1_1, l_1_2)
  end
  local l_1_3
  for l_1_4 = 1, #l_1_1 do
    if l_1_1[l_1_4] == "/tr" then
      l_1_3 = l_1_1[l_1_4 + 1]
      break
    end
  end
  return l_1_3
end

local l_0_2 = l_0_1(l_0_0)
if l_0_2 ~= nil and sysio.IsFileExists(l_0_2) and checkFileLastWriteTime(l_0_2, 3600) and not mp.IsKnownFriendlyFile(l_0_2, true, false) then
  local l_0_3 = {
    "\\users\\public\\.+",
    "\\users\\.+\\appdata\\roaming\\.+",
    "\\users\\.+\\appdata\\local\\temp\\.+",
    "\\users\\.+\\appdata\\local\\temp\\7z.+",
    "\\users\\.+\\appdata\\local\\temp\\rar.+",
    "\\users\\.+\\appdata\\local\\temp\\bnz.+",
    "\\device\\cdrom.+",
    "\\device\\mup\\.+"
  }
  local l_0_4 = {
    "powershell.exe"
  }
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if l_0_2:find(l_0_6) and IsProcNameInParentProcessTree("BM", l_0_4) then
      mp.ReportLowfi(l_0_2, 1601144733)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
