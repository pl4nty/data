-- Threat: !InfrastructureShared
-- Name: 15b30e3ab7ae
-- Type: 21

local l_0_0 = MpCommon.GetPersistContextNoPath("MiKatzExe")
if l_0_0 ~= nil then
  for l_0_1, l_0_2 in ipairs(l_0_0) do
    if sysio.IsFileExists(l_0_2) then
      bm.add_threat_file(l_0_2)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
