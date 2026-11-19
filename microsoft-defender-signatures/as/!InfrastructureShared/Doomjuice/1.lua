-- Threat: !InfrastructureShared
-- Name: Doomjuice
-- Type: 17

local function l_0_0(l_1_0, l_1_1)
  if l_1_1 and l_1_1 ~= "" then
    table.insert(l_1_0, l_1_1)
  end
end

local function l_0_1(l_2_0, l_2_1)
  if l_2_1 then
    for l_2_2, l_2_3 in pairs(l_2_1) do
      l_0_0(l_2_0, l_2_3)
    end
  end
end

local l_0_2 = {}
local l_0_3 = sysio.GetLogicalDrivesMask()
if l_0_3 then
  for l_0_4 = 2, 25 do
    if crypto.bitand(crypto.shr32(l_0_3, l_0_4), 1) == 1 then
      l_0_0(l_0_2, string.format("%c:\\", 65 + l_0_4))
    end
  end
end
l_0_1(l_0_2, sysio.ExpandFilePath("%userprofile%", true))
local l_0_5 = MpCommon.ExpandEnvironmentVariables("%windir%")
if l_0_5 then
  l_0_0(l_0_2, l_0_5)
  l_0_0(l_0_2, l_0_5 .. "\\system32")
end
l_0_0(l_0_2, MpCommon.ExpandEnvironmentVariables("%temp%"))
local l_0_6 = {
  "sync-src-1.00.tbz",
  "regedit.exe"
}
for l_0_7, l_0_8 in pairs(l_0_2) do
  for l_0_9, l_0_10 in ipairs(l_0_6) do
    local l_0_11 = sysio.FindFiles(l_0_8, l_0_10, 0)
    if l_0_11 then
      for l_0_12, l_0_13 in pairs(l_0_11) do
        MpDetection.ScanResource("file://" .. l_0_13)
      end
    end
  end
end
