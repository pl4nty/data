-- Threat: !InfrastructureShared
-- Name: 55b3667e6849
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "\\tanium client\\taniumclient.exe", -31, true) then
        return mp.CLEAN
      elseif string.find(l_0_4, "\\syncappvpublishingserver.exe", -29, true) then
        TrackPidAndTechniqueBM("BM", "T1490", "inhibit_system_recovery")
        return mp.INFECTED
      end
    end
  end
end
return mp.INFECTED
