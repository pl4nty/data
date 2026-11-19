-- Threat: !InfrastructureShared
-- Name: a4b37a2fd1a9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.PathToWin32Path(l_0_0)
if isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = MpCommon.GetMountedFileBackingFilePath(l_0_2)
if isnull(l_0_3) then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = l_0_3:match("([^.]+)$")
if l_0_4 ~= ".vhdx" then
  return mp.CLEAN
end
bm.add_related_file(l_0_3)
return mp.INFECTED
