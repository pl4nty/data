-- Threat: \xac\xa1LinuxXplatSysIOAPITest.A
-- Type: 13
-- MpAttributes: !MpOnOpenOrCloseRtpScan & BM_TEXT_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_0 ~= "/tmp/0c02a078-ea6f-4635-b4c5-be81241d7bb9-sysiotestfile-1.txt" then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) ~= true then
  return mp.CLEAN
end
if sysio.IsFolderExists("/tmp") ~= true then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileSize(l_0_0)
if l_0_1 < 10 then
  return mp.CLEAN
end
local l_0_2 = sysio.ReadFile(l_0_0, 0, l_0_1)
if l_0_2 == nil or string.find(l_0_2, "0123456789", 1, true) == nil then
  return mp.CLEAN
end
local l_0_3 = sysio.GetFileAttributes(l_0_0)
if l_0_3 == nil or mp.bitand(l_0_3, 61440) ~= 32768 then
  return mp.CLEAN
end
return mp.INFECTED
