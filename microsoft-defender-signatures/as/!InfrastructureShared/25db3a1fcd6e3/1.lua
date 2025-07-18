-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25db3a1fcd6e3\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
if l_0_0 then
  for l_0_5,l_0_6 in ipairs(l_0_0) do
    if l_0_6.ppid and l_0_6.image_path then
      local l_0_7 = (string.lower)(l_0_6.image_path)
      if (string.find)(l_0_7, "w3wp", 1, true) and (mp.bitand)(l_0_6.reason_ex, 1) == 1 then
        (bm.add_related_string)("Recent_Threats", GetRollingQueueAsHashTable("RecentThreatsOnMachine"), bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

