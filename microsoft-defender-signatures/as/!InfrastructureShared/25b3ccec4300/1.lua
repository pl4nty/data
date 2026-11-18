-- Threat: !InfrastructureShared
-- Name: 25b3ccec4300
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_imagepath()
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_0.ppid .. ";ImagePath:" .. l_0_1
if not mp.IsKnownFriendlyFile(l_0_1, true, false) then
  MpCommon.AppendPersistContextNoPath("bm_uacbypass_connmgr", l_0_2, 2)
end
local l_0_3, l_0_4 = bm.get_process_relationships(l_0_0.ppid)
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.ppid and l_0_6.image_path and not mp.IsKnownFriendlyFile(l_0_6.image_path, true, false) then
    l_0_2 = l_0_6.ppid .. ";ImagePath:" .. l_0_6.ImagePath
    MpCommon.AppendPersistContextNoPath("bm_uacbypass_connmgr", l_0_2, 2)
  end
end
return mp.CLEAN
