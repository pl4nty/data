-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\88e2_331.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.image_path ~= nil then
    local l_0_2 = (string.lower)(l_0_1.image_path)
    ;
    (bm.add_related_file)(l_0_2)
  end
end
do
  return mp.INFECTED
end

