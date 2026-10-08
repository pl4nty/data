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
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if l_0_1 then
  local l_0_2, l_0_3 = (string.match)(l_0_1, "^/([^/]+)/([^/]+)")
  if l_0_2 and l_0_3 then
    local l_0_4 = (string.lower)(l_0_2 .. "_" .. l_0_3)
    ;
    (mp.set_mpattribute)("Lua:Linux:ProcPath_" .. l_0_4)
  end
end
do
  local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_5 ~= nil then
    local l_0_6 = (mp.GetParentProcInfo)(l_0_5)
    if l_0_6 ~= nil and l_0_6.image_path ~= nil then
      local l_0_7 = (string.lower)((string.match)(l_0_6.image_path, "([^/]+)$"))
      if l_0_7 ~= nil then
        (mp.set_mpattribute)("Lua:Linux:Parent_" .. l_0_7)
      end
    end
  end
  do
    return mp.CLEAN
  end
end

