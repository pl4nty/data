-- Threat: !InfrastructureShared
-- Name: Tracur
-- Type: 17

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%WINDIR%\\system32")
if l_0_0 then
  for l_0_1, l_0_2 in ipairs({"*32.exe", "*32.dll"}) do
    local l_0_3 = sysio.FindFiles(l_0_0, l_0_2, 0)
    if l_0_3 then
      for l_0_4, l_0_5 in pairs(l_0_3) do
        MpDetection.ScanResource("file://" .. l_0_5)
      end
    end
  end
end
local l_0_6 = MpCommon.ExpandEnvironmentVariables("%PROGRAMFILES%\\Mozilla Firefox\\extensions")
if l_0_6 then
  for l_0_7, l_0_8 in ipairs({"*.js", "*.xul"}) do
    local l_0_9 = sysio.FindFiles(l_0_6, l_0_8, 100)
    if l_0_9 then
      for l_0_10, l_0_11 in pairs(l_0_9) do
        MpDetection.ScanResource("file://" .. l_0_11)
      end
    end
  end
end
local l_0_12 = MpCommon.ExpandEnvironmentVariables("%APPDATA%\\Opera")
if l_0_12 then
  local l_0_13 = sysio.FindFiles(l_0_12, "*.js", 100)
  if l_0_13 then
    for l_0_14, l_0_15 in pairs(l_0_13) do
      MpDetection.ScanResource("file://" .. l_0_15)
    end
  end
end
