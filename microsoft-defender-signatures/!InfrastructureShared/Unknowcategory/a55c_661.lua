-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a55c_661.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "%.%w+:%d%d+ ") then
  local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
  do
    do
      if l_0_2 ~= nil then
        local l_0_3 = (string.lower)(l_0_2.image_path)
        if (string.find)(l_0_3, "\\appdata\\roaming\\", 1, true) or (string.find)(l_0_3, "\\appdata\\local\\", 1, true) or (string.find)(l_0_3, "\\programdata\\", 1, true) then
          (bm.add_threat_file)(l_0_3)
        else
          ;
          (bm.add_related_file)(l_0_3)
        end
      end
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

