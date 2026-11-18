-- Threat: !InfrastructureShared
-- Name: 41d76c7ebc01
-- Type: 21
-- Includes: LuaFuncHelper, ResearchData

local l_0_0 = mp.GetParentProcInfo()
if not l_0_0 or not l_0_0.image_path then
  return mp.CLEAN
end
local l_0_1 = {
  "werfault.exe",
  "svchost.exe",
  "WerFaultSecure.exe",
  "wermgr.exe",
  "NisSrv.exe",
  "te.processhost.exe",
  "testhost.exe"
}
if l_0_0 and l_0_0.image_path and Contains_any_caseinsenstive(l_0_0.image_path, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = string.match(l_0_3, "/pid%s+(%d+)")
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = {
  "HKLM\\SYSTEM\\CurrentControlSet\\Services\\WinDefend",
  "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Sense"
}
for l_0_6, l_0_7 in ipairs(l_0_5) do
  local l_0_8 = sysio.RegOpenKey(l_0_7)
  if l_0_8 then
    local l_0_9 = sysio.GetRegValueAsString(l_0_8, "ImagePath")
    if l_0_9 then
      l_0_9 = l_0_9:gsub("\"", "")
      l_0_9 = l_0_9:gsub("'", "")
      l_0_9 = mp.ContextualExpandEnvironmentVariables(l_0_9) or l_0_9
      local l_0_10 = sysio.GetProcessFromFileName(l_0_9)
      if l_0_10 and 0 < #l_0_10 then
        for l_0_11, l_0_12 in pairs(l_0_10) do
          if l_0_12.pid and tostring(l_0_12.pid) == l_0_4 then
            local l_0_13 = l_0_12.pid .. "->" .. l_0_9 .. "->" .. l_0_3
            set_research_data("AffectedService", MpCommon.Base64Encode(l_0_13), false)
            if l_0_0 and l_0_0.ppid then
              MpCommon.BmTriggerSig(l_0_0.ppid, "SuspWerFaultSec_CMD", l_0_13)
            end
            if l_0_0 and l_0_0.image_path and Contains_any_caseinsenstive(l_0_0.image_path, {
              "powershell.exe",
              "pwsh.exe"
            }) then
              return mp.CLEAN
            end
            return mp.INFECTED
          end
        end
      end
    end
  end
end
return mp.CLEAN
