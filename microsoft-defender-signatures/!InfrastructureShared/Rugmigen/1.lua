-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Rugmigen\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if l_0_0.Active and (string.match)(l_0_0.Name, "Behavior:Win32/Rugmigen.") then
  local l_0_1 = GetRollingQueue("Rugmigen_Parent")
  if l_0_1 ~= nil and type(l_0_1) == "table" then
    for l_0_5 in pairs(l_0_1) do
      local l_0_6 = tostring((l_0_1[l_0_5]).key)
      if (sysio.IsFileExists)(l_0_6) then
        (sysio.DeleteFile)(l_0_6)
      end
    end
    pcall(MpCommon.RollingQueueErase, "Rugmigen_Parent")
    local l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
    local l_0_8 = (sysio.RegOpenKey)(l_0_7 .. "Paths")
    if l_0_8 then
      local l_0_9 = {}
      -- DECOMPILER ERROR at PC60: No list found for R4 , SetList fails

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC62: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC67: Overwrote pending register: R7 in 'AssignReg'

      DeleteRegistryEntriesOnValueMatch(l_0_8, "%programdata%", false)
    end
  end
end

