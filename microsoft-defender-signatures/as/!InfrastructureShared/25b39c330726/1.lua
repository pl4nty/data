-- Threat: !InfrastructureShared
-- Name: 25b39c330726
-- Type: 21

local l_0_0 = MpCommon.GetPersistContextNoPath("OfficeLaunchesWmi")
if l_0_0 then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
