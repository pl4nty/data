-- Threat: !InfrastructureShared
-- Name: Sober
-- Type: 17

local l_0_0 = {
  {
    folder = "%windir%\\system32",
    pattern = "*.exe"
  },
  {
    folder = "%windir%\\msagent\\system",
    pattern = "zipzip.zab"
  },
  {
    folder = "%windir%\\Config\\system",
    pattern = "zipped.wrm"
  }
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  local l_0_3 = MpCommon.ExpandEnvironmentVariables(l_0_2.folder)
  if l_0_3 then
    local l_0_4 = sysio.FindFiles(l_0_3, l_0_2.pattern, 0)
    if l_0_4 then
      for l_0_5, l_0_6 in pairs(l_0_4) do
        MpDetection.ScanResource("file://" .. l_0_6)
      end
    end
  end
end
