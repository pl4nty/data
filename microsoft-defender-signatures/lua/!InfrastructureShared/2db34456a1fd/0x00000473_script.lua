-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2db34456a1fd\0x00000473_luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = nil
local l_0_2 = (bm.get_current_process_startup_info)()
do
  if l_0_2 ~= nil and l_0_2.command_line ~= nil then
    local l_0_3 = (string.lower)(l_0_2.command_line)
    if (string.find)(l_0_3, "-ap \"msexchange", 1, true) then
      l_0_1 = l_0_3:match("-ap \"([^\"]+)\"")
      if l_0_1 ~= nil then
        l_0_0 = true
      end
    end
  end
  local l_0_4 = nil
  if (this_sigattrlog[2]).matched then
    l_0_4 = (this_sigattrlog[2]).utf8p2
  end
  if l_0_4 ~= nil then
    l_0_4 = ((string.lower)(l_0_4)):match("lua:peoriginalname!(.*)$")
  end
  local l_0_5 = {}
  if l_0_4 and l_0_0 then
    local l_0_6 = table.insert
    local l_0_7 = l_0_5
    local l_0_8 = {}
    l_0_8.applicationname = l_0_1
    l_0_8.modulename = l_0_4
    l_0_6(l_0_7, l_0_8)
  else
    do
      if l_0_4 and not l_0_0 then
        local l_0_9 = table.insert
        local l_0_10 = l_0_5
        local l_0_11 = {}
        l_0_11.modulename = l_0_4
        l_0_9(l_0_10, l_0_11)
      end
      do
        if #l_0_5 > 0 then
          (bm.add_related_string)("InMemoryLoadBlocked", safeJsonSerialize(l_0_5), bm.RelatedStringBMReport)
          ;
          (bm.set_detection_string)(safeJsonSerialize(l_0_5))
        end
        return mp.INFECTED
      end
    end
  end
end

