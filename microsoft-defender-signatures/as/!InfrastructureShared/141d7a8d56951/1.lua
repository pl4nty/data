-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\141d7a8d56951\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not isnull(l_0_0) then
  local l_0_1 = l_0_0.image_path
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if not isnull(l_0_1) and not isnull(l_0_2) then
    l_0_1 = (string.lower)(l_0_1)
    l_0_2 = (string.lower)(l_0_2)
    if (string.find)(l_0_1, "\\system32\\dllhost.exe", 1, true) and (string.find)(l_0_2, "{3e5fc7f9-9a51-4367-9063-a120244fbec7}", 1, true) and (MpCommon.GetPersistContextCountNoPath)("bm_uacbypass_connmgr") > 0 then
      local l_0_3 = (MpCommon.GetPersistContextNoPath)("bm_uacbypass_connmgr")
      if l_0_3 then
        local l_0_4 = false
        for l_0_8,l_0_9 in ipairs(l_0_3) do
          l_0_9 = (string.gsub)(l_0_9, ",", "_")
          set_research_data("PossibleTrigger", l_0_9, false)
          l_0_4 = true
        end
        if l_0_4 == true then
          if (versioning.IsSeville)() then
            return mp.INFECTED
          end
          return mp.LOWFI
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

