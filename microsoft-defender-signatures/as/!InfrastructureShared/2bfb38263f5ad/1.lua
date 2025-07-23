-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2bfb38263f5ad\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
local l_0_2 = nil
if (this_sigattrlog[13]).matched and (this_sigattrlog[13]).utf8p2 then
  l_0_2 = (this_sigattrlog[13]).utf8p2
end
if l_0_0 then
  for l_0_6,l_0_7 in ipairs(l_0_0) do
    if l_0_7.ppid and l_0_7.image_path then
      local l_0_8 = (string.lower)(l_0_7.image_path)
      if (string.find)(l_0_8, "w3wp", 1, true) then
        local l_0_9 = GetRollingQueueAsHashTable("RecentThreatsOnMachine")
        ;
        (bm.add_related_string)("Recent_Threats", l_0_9, bm.RelatedStringBMReport)
        if l_0_2 then
          l_0_2 = (string.lower)(l_0_2)
          if (string.find)(l_0_2, "-ap \"sharepoint", 1, true) then
            (bm.trigger_sig)("SuspSharepointSession", safeJsonDeserialize(l_0_9))
          end
        end
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

