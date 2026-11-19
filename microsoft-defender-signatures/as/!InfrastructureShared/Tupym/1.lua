-- Threat: !InfrastructureShared
-- Name: Tupym
-- Type: 17

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\WorkgroupCrawler\\Shares\\shared")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    local l_0_3 = sysio.RegOpenKey(l_0_2)
    if l_0_3 then
      local l_0_4 = sysio.GetRegValueAsString(l_0_3, "shared")
      if l_0_4 then
        MpDetection.ScanResource("file://" .. l_0_4)
      end
    end
  end
end
