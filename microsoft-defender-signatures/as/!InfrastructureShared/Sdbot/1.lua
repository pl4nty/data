-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Sdbot\1.luac 

-- params : ...
-- function num : 0
if (string.match)((Remediation.Threat).Name, "Sdbot") then
  local l_0_0 = (MpCommon.ExpandEnvironmentVariables)("%windir%\\System32\\WinSvc32")
  local l_0_1 = (MpCommon.ExpandEnvironmentVariables)("%ALLUSERSPROFILE%\\Start Menu\\Programs\\Startup")
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC20: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("HKLM\\software\\microsoft\\windows\\currentversion\\explorer\\shell folders")("HKLM\\software\\microsoft\\windows\\currentversion\\explorer\\user shell folders") do
    local l_0_8 = (sysio.RegOpenKey)(l_0_7)
    if l_0_8 then
      local l_0_9 = (sysio.GetRegValueAsString)(l_0_8, "Common Startup")
      if l_0_9 == l_0_0 then
        (sysio.SetRegValueAsString)(l_0_8, "Common Startup", l_0_1)
      end
    end
  end
  if (string.match)((Remediation.Threat).Name, "Sdbot%.") then
    Infrastructure_FixHostsFile()
  end
end

