-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2fab3fcee2674\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  (bm.request_SMS)(l_0_0.ppid, "M")
  ;
  (bm.add_action)("EmsScan", 500)
end
local l_0_1, l_0_2 = (bm.get_process_relationships)()
if l_0_2 ~= nil then
  for l_0_6,l_0_7 in ipairs(l_0_2) do
    if l_0_7 ~= nil and l_0_7.ppid ~= nil then
      (bm.request_SMS)(l_0_7.ppid, "M")
    end
  end
end
do
  return mp.INFECTED
end

