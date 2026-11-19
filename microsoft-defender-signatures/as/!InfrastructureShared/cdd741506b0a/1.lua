-- Threat: !InfrastructureShared
-- Name: cdd741506b0a
-- Type: 21
-- Includes: TechniqueTracker

local function l_0_0(l_1_0)
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

local l_0_1 = mp.GetScannedPPID()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_1)
if l_0_2 and l_0_2.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
local l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_1))
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_0(l_0_3)
if l_0_4 ~= nil and sysio.IsFileExists(l_0_4) and checkFileLastWriteTime(l_0_4, 3600) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
  local l_0_5 = {
    "\\users\\public\\.+",
    "\\users\\.+\\appdata\\roaming\\.+",
    "\\users\\.+\\appdata\\local\\temp\\.+",
    "\\users\\.+\\appdata\\local\\temp\\7z.+",
    "\\users\\.+\\appdata\\local\\temp\\rar.+",
    "\\users\\.+\\appdata\\local\\temp\\bnz.+",
    "\\device\\cdrom.+",
    "\\device\\mup\\.+"
  }
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if l_0_4:find(l_0_7) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
