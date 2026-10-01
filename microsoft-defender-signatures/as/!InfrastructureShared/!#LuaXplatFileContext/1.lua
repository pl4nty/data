-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaXplatFileContext\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
;
(mp.set_mpattribute)("Lua:Linux:ProcName_" .. l_0_0)
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 ~= nil then
  local l_0_2 = (mp.GetParentProcInfo)(l_0_1)
  if l_0_2 ~= nil and l_0_2.image_path ~= nil then
    local l_0_3 = (string.lower)((string.match)(l_0_2.image_path, "([^/]+)$"))
    if l_0_3 ~= nil then
      (mp.set_mpattribute)("Lua:Linux:Parent_" .. l_0_3)
    end
  end
end
do
  return mp.CLEAN
end

