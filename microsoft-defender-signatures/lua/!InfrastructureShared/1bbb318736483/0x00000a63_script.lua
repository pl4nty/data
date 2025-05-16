-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1bbb318736483\0x00000a63_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil or l_0_0.command_line == nil or l_0_0.command_line == "" then
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  local l_0_1 = l_0_0.command_line
  if (string.find)(l_0_1, "/elfsigner.py", 1, true) or (string.find)(l_0_1, "--no_disclaimer", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = nil
  if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
    l_0_2 = (this_sigattrlog[8]).utf8p2
  end
  local l_0_3 = nil
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p1 ~= nil then
    l_0_3 = (this_sigattrlog[10]).utf8p1
  end
  local l_0_4 = nil
  if l_0_2 ~= nil then
    l_0_4 = l_0_2:match("-pass%s+file:([^%s]+)")
  end
  if l_0_4 ~= nil and l_0_4:sub(1, 1) ~= "/" then
    local l_0_5 = nil
    if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
      l_0_5 = (this_sigattrlog[9]).utf8p1
    end
    get_basename = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = l_1_0:reverse()
  local l_1_2 = l_1_1:match("([^/]+)")
  local l_1_3, l_1_4 = l_1_2:reverse, l_1_2
  do return l_1_3(l_1_4) end
  -- DECOMPILER ERROR at PC8: Confused about usage of register R4 for local variables in 'ReleaseLocals'

end

    if l_0_5 ~= nil then
      local l_0_6 = get_basename(l_0_4)
      local l_0_7 = get_basename(l_0_5)
      if l_0_6 ~= nil and l_0_7 ~= nil and l_0_6 == l_0_7 then
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      else
        return mp.CLEAN
      end
    end
  end
  do
    do
      if l_0_4 ~= nil and l_0_3 ~= nil and l_0_4 == l_0_3 then
        addRelatedProcess()
        reportRelatedBmHits()
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

