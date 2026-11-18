-- Threat: !InfrastructureShared
-- Name: Spybot
-- Type: 17

local l_0_0 = {
  "%windir%\\system32\\kazaacrackfiles",
  "%windir%\\system32\\kazaabackupfiles",
  "%windir%\\system32\\kazaabackup",
  "%windir%\\system32\\kazaahotfiles",
  "%windir%\\system32\\kazaasystemfiles",
  "%windir%\\system32\\kazaabinaries",
  "%windir%\\system32\\rasdialer",
  "%windir%\\system32\\sharedfiles",
  "%windir%\\system32\\shellext",
  "%windir%\\system32\\sysbckp",
  "%windir%\\system32\\neveragain",
  "%windir%\\system32\\kzmd",
  "%windir%\\system32\\kazaatemp",
  "%windir%\\system32\\temp32",
  "%windir%\\system32\\kaza",
  "%windir%\\system32\\ntfixbackupfiles",
  "%windir%\\system32\\gator",
  "%windir%\\system32\\tmpkazaa",
  "%windir%\\system32\\sharedfolder"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3 = MpCommon.ExpandEnvironmentVariables(l_0_2)
  if l_0_3 then
    local l_0_4 = sysio.FindFiles(l_0_3, "*", 0)
    if l_0_4 then
      for l_0_5, l_0_6 in pairs(l_0_4) do
        MpDetection.ScanResource("file://" .. l_0_6)
      end
    end
  end
end
