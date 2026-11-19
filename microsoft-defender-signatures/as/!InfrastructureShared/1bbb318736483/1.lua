-- Threat: !InfrastructureShared
-- Name: 1bbb318736483
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.command_line == nil or l_0_0.command_line == "" then
  return mp.CLEAN
end
if IsTaintedProcessinParentTreeForLinux("upx_file_created_taint") or IsTaintedProcessinParentTreeForLinux("remote_file_created_taint") or IsTaintedProcessinParentTreeForLinux("masqueraded_file_extension_taint") or IsTaintedProcessinParentTreeForLinux("mounted_file_execution") then
  local l_0_1 = l_0_0.command_line
  if string.find(l_0_1, "/elfsigner.py", 1, true) or string.find(l_0_1, "--no_disclaimer", 1, true) then
    return mp.CLEAN
  end
  local l_0_2
  if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
    l_0_2 = this_sigattrlog[8].utf8p2
  end
  local l_0_3
  if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
    l_0_3 = this_sigattrlog[10].utf8p1
  end
  local l_0_4
  if l_0_2 ~= nil then
    l_0_4 = l_0_2:match("-pass%s+file:([^%s]+)")
  end
  if l_0_4 ~= nil and l_0_4:sub(1, 1) ~= "/" then
    local l_0_5
    if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
      l_0_5 = this_sigattrlog[9].utf8p1
    end
    
    function get_basename(l_1_0)
      local l_1_1 = l_1_0:reverse()
      local l_1_2 = l_1_1:match("([^/]+)")
      return l_1_2:reverse()
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
  if l_0_4 ~= nil and l_0_3 ~= nil and l_0_4 == l_0_3 then
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
