-- Threat: !InfrastructureShared
-- Name: Rugmigen
-- Type: 15
-- Includes: LuaFuncHelper, ExcludeProc

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "Behavior:Win32/Rugmigen.") then
  local l_0_1 = GetRollingQueue("Rugmigen_Parent")
  if l_0_1 ~= nil and type(l_0_1) == "table" then
    for l_0_2 in pairs(l_0_1) do
      local l_0_3 = tostring(l_0_1[l_0_2].key)
      if sysio.IsFileExists(l_0_3) then
        sysio.DeleteFile(l_0_3)
      end
    end
    pcall(MpCommon.RollingQueueErase, "Rugmigen_Parent")
    local l_0_4 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
    local l_0_5 = sysio.RegOpenKey(l_0_4 .. "Paths")
    if l_0_5 then
      local l_0_6 = {
        "%appdata%",
        "%localappdata%",
        "%programdata%"
      }
      l_0_6 = GetPathsFromExpandFilePath(l_0_6)
      DeleteRegistryEntriesOnValueMatch(l_0_5, l_0_6, false)
    end
  end
end
