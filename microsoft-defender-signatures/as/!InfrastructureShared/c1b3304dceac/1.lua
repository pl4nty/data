-- Threat: !InfrastructureShared
-- Name: c1b3304dceac
-- Type: 21

function random(l_1_0)
  local l_1_1 = 214013 * l_1_0 + 2531011
  
  local l_1_2 = mp.bitand(mp.shr32(l_1_1, 16), 32767)
  return l_1_2, l_1_1
end

function guid(l_2_0)
  local l_2_1, l_2_2, l_2_3, l_2_4, l_2_5, l_2_6, l_2_7, l_2_8
  local l_2_9 = l_2_0
  l_2_1, l_2_9 = random(l_2_9)
  l_2_2, l_2_9 = random(l_2_9)
  l_2_3, l_2_9 = random(l_2_9)
  l_2_4, l_2_9 = random(l_2_9)
  l_2_4 = mp.bitor(mp.bitand(l_2_4, 4095), 16384)
  l_2_5, l_2_9 = random(l_2_9)
  l_2_5 = l_2_5 % 16383 + 32768
  l_2_6, l_2_9 = random(l_2_9)
  l_2_7, l_2_9 = random(l_2_9)
  l_2_8, l_2_9 = random(l_2_9)
  return string.format("{%0.4X%0.4X-%0.4X-%0.4X-%0.4X-%0.4X%0.4X%0.4X}", l_2_1, l_2_2, l_2_3, l_2_4, l_2_5, l_2_6, l_2_7, l_2_8)
end

local l_0_0 = mp.ContextualExpandEnvironmentVariables("%temp%")
local l_0_1 = sysio.GetFileFsVolumeInformation(l_0_0)
local l_0_2 = l_0_1.VolumeSerialNumber
local l_0_3 = guid(l_0_2)
local l_0_4 = this_sigattrlog[2].wp1
if this_sigattrlog[3].matched then
  l_0_4 = this_sigattrlog[3].wp1
end
l_0_4 = mp.utf16to8(l_0_4)
if string.find(string.lower(l_0_4), string.lower(l_0_3), 1, true) == nil then
  return mp.CLEAN
end
local l_0_5 = this_sigattrlog[1].utf8p1
local l_0_6 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_7 = mp.GetExecutablesFromCommandLine(l_0_6)
if #l_0_7 == 1 then
  mp.ReportLowfi(l_0_5, 1553292636)
  return mp.INFECTED
end
for l_0_8 = 2, #l_0_7 do
  if sysio.IsFileExists(l_0_7[l_0_8]) then
    if string.match(l_0_7[l_0_8], "\\(Application Data|ProgramData)\\[0-9a-z]+\\[.0-9a-z]+$") ~= nil then
      mp.ReportLowfi(l_0_7[l_0_8], 954960809)
    else
      mp.ReportLowfi(l_0_7[l_0_8], 3621865083)
    end
  end
end
return mp.INFECTED
