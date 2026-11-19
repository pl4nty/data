-- Threat: !InfrastructureShared
-- Name: 164b3d78ac11c
-- Type: 21

if MpCommon.GetPersistContextCountNoPath("CreatedAppDataMsi") > 0 then
  local l_0_0 = MpCommon.GetPersistContextNoPath("CreatedAppDataMsi")
  if l_0_0 ~= nil then
    for l_0_1, l_0_2 in ipairs(l_0_0) do
      if sysio.IsFileExists(l_0_2) then
        bm.add_related_file(l_0_2)
      end
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
