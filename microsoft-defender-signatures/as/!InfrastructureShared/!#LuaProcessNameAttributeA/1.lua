-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaProcessNameAttributeA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_parent_filehandle)()
if not (mp.is_handle_nil)(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if not l_0_1 or #l_0_1 > 44 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, " ", 1, true) ~= nil then
  l_0_1 = l_0_1:gsub("%s", "/x20")
  if l_0_1 == nil or #l_0_1 > 44 then
    return mp.CLEAN
  end
end
local l_0_2 = "Lua:ProcNameAttr!"
;
(mp.set_mpattribute)(l_0_2 .. l_0_1)
local l_0_3, l_0_4 = isLolBasFilename(l_0_1)
do
  if l_0_3 == true and l_0_4 ~= nil then
    local l_0_5 = "Lua:LolbasProcessName.A"
    ;
    (mp.set_mpattribute)(l_0_5)
    ;
    (mp.set_mpattribute)(l_0_5 .. "!" .. l_0_4)
  end
  if (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
    local l_0_6 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
    if l_0_6 == nil then
      return mp.CLEAN
    end
    local l_0_7 = (mp.GetParentProcInfo)(l_0_6)
    if l_0_7 == nil then
      return mp.CLEAN
    end
    local l_0_8 = l_0_7.image_path
    if l_0_8 == nil then
      return mp.CLEAN
    end
    local l_0_9 = (string.match)(l_0_8, "([^\\]+)$")
    if l_0_9 == nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_9, " ", 1, true) ~= nil then
      l_0_9 = l_0_9:gsub("%s", "/x20")
      if l_0_9 == nil or #l_0_9 > 38 then
        return mp.CLEAN
      end
    end
    local l_0_10 = "Lua:ParentProcNameAttr!"
    ;
    (mp.set_mpattribute)(l_0_10 .. l_0_9)
    local l_0_11, l_0_12 = isLolBasFilename(l_0_9)
    if l_0_11 == true and l_0_12 ~= nil then
      local l_0_13 = "Lua:LolbasParentProcessName.A"
      ;
      (mp.set_mpattribute)(l_0_13)
      ;
      (mp.set_mpattribute)(l_0_13 .. "!" .. l_0_12)
    end
  end
  do
    return mp.CLEAN
  end
end

