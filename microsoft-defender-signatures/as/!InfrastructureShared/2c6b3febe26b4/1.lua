-- Threat: !InfrastructureShared
-- Name: 2c6b3febe26b4
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and l_0_3.image_path then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "httpd.exe", 1, true) then
        bm.add_related_string("Recent_Threats", GetRollingQueueAsHashTable("RecentThreatsOnMachine"), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
