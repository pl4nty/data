-- Threat: !InfrastructureShared
-- Name: Nuwar
-- Type: 17

local l_0_0 = {
  "%windir%\\system32\\windev~1.sys",
  "%windir%\\system32\\windev~2.sys",
  "%windir%\\system32\\windev~3.sys",
  "%windir%\\system32\\windev~4.sys",
  "%windir%\\system32\\wincom32.sys",
  "%windir%\\system32\\spooldr.sys",
  "%windir%\\system32\\spooldr.ini",
  "%windir%\\spooldr.exe",
  "%windir%\\spooldr.ini",
  "%windir%\\system32\\drivers\\tcpip.sys",
  "%windir%\\system32\\dllcache\\tcpip.sys",
  "%windir%\\system32\\windev-peers.ini",
  "%windir%\\system32\\wincom32.ini",
  "%windir%\\system32\\vdo_g.ini",
  "%windir%\\system32\\clean.config",
  "%windir%\\system32\\init_sys.config",
  "%windir%\\system32\\bldy.config",
  "%windir%\\system32\\ortyeras.config",
  "%windir%\\system32\\kalleny.config"
}
for l_0_1, l_0_2 in ipairs(l_0_0) do
  MpDetection.ScanResource("file://" .. l_0_2)
end
local l_0_3 = {
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F"
}
for l_0_4, l_0_5 in ipairs({"init_", "clean"}) do
  for l_0_6, l_0_7 in ipairs(l_0_3) do
    MpDetection.ScanResource("file://%windir%\\system32\\" .. l_0_5 .. l_0_7 .. "~1.sys")
  end
end
for l_0_8, l_0_9 in ipairs({"vdo_", "bldy"}) do
  for l_0_10, l_0_11 in ipairs(l_0_3) do
    for l_0_12, l_0_13 in ipairs(l_0_3) do
      MpDetection.ScanResource("file://%windir%\\system32\\" .. l_0_9 .. l_0_11 .. l_0_13 .. "~1.sys")
    end
  end
end
