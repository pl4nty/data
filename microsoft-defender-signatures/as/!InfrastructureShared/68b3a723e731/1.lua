-- Threat: !InfrastructureShared
-- Name: 68b3a723e731
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
if not sysio.IsFileExists(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = sysio.GetFileLastWriteTime(l_0_0)
if not sysio.GetLastResult().Success or l_0_1 == 0 then
  return mp.CLEAN
end
l_0_1 = l_0_1 / 10000000 - 11644473600
local l_0_2 = MpCommon.GetCurrentTimeT()
if l_0_1 >= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (l_0_2 - l_0_1) / 60
local l_0_5 = l_0_3 <= 1440
if not l_0_5 then
  return mp.CLEAN
end
if 9 <= #l_0_0 and string.sub(l_0_0, 2, 9) == ":\\users\\" or 15 <= #l_0_0 and string.sub(l_0_0, 2, 15) == ":\\programdata\\" then
  return mp.INFECTED
end
return mp.CLEAN
