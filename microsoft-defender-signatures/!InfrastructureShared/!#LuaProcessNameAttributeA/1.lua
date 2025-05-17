-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaProcessNameAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_0 or #l_0_0 > 44 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, " ", 1, true) ~= nil then
  l_0_0 = l_0_0:gsub("%s", "/x20")
  if l_0_0 == nil or #l_0_0 > 44 then
    return mp.CLEAN
  end
end
local l_0_1 = "Lua:ProcNameAttr!"
;
(mp.set_mpattribute)(l_0_1 .. l_0_0)
local l_0_2, l_0_3 = isLolBasFilename(l_0_0)
do
  if l_0_2 == true and l_0_3 ~= nil then
    local l_0_4 = "Lua:LolbasProcessName.A"
    ;
    (mp.set_mpattribute)(l_0_4)
    ;
    (mp.set_mpattribute)(l_0_4 .. "!" .. l_0_3)
  end
  if (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
    local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    local l_0_6 = (mp.GetParentProcInfo)(l_0_5)
    if l_0_6 == nil then
      return mp.CLEAN
    end
    local l_0_7 = l_0_6.image_path
    if l_0_7 == nil then
      return mp.CLEAN
    end
    local l_0_8 = (string.match)(l_0_7, "([^\\]+)$")
    if l_0_8 == nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_8, " ", 1, true) ~= nil then
      l_0_8 = l_0_8:gsub("%s", "/x20")
      if l_0_8 == nil or #l_0_8 > 38 then
        return mp.CLEAN
      end
    end
    local l_0_9 = "Lua:ParentProcNameAttr!"
    ;
    (mp.set_mpattribute)(l_0_9 .. l_0_8)
    local l_0_10, l_0_11 = isLolBasFilename(l_0_8)
    if l_0_10 == true and l_0_11 ~= nil then
      local l_0_12 = "Lua:LolbasParentProcessName.A"
      ;
      (mp.set_mpattribute)(l_0_12)
      ;
      (mp.set_mpattribute)(l_0_12 .. "!" .. l_0_11)
    end
  end
  do
    return mp.CLEAN
  end
end

