-- Threat: !InfrastructureShared
-- Name: e3b305de5c90
-- Type: 21

local l_0_0 = MpCommon.GetPersistContextNoPath("ServiceCreationScript")
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if sysio.IsFileExists(l_0_2) then
      mp.ReportLowfi(l_0_2, 1919899276)
      bm.add_related_file(l_0_2)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
