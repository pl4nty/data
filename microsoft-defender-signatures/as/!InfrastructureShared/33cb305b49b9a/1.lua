-- Threat: !InfrastructureShared
-- Name: 33cb305b49b9a
-- Type: 21

local l_0_0, l_0_1, l_0_2, l_0_3
local l_0_4 = bm.GetProcedureMatchDuration(0)
local l_0_5 = bm.GetProcedureMatchDuration(1)
if l_0_4 > l_0_5 then
  l_0_1 = l_0_4 - l_0_5
else
  l_0_1 = l_0_5 - l_0_4
end
if 20000000 < l_0_1 then
  return mp.CLEAN
end
if this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p1
elseif this_sigattrlog[18].matched then
  l_0_0 = this_sigattrlog[18].utf8p1
elseif this_sigattrlog[17].matched then
  l_0_0 = this_sigattrlog[17].utf8p1
elseif this_sigattrlog[19].matched then
  l_0_0 = this_sigattrlog[19].utf8p1
end
if string.match(l_0_0, "^/home/") or string.match(l_0_0, "^/root/") or string.match(l_0_0, "^/tmp/") or string.match(l_0_0, "^/var/") or string.match(l_0_0, "^/dev/shm/") or string.match(l_0_0, "^/srv/ftp/") or string.match(l_0_0, "^/mnt/") then
  if this_sigattrlog[1].matched then
    l_0_2 = this_sigattrlog[1].utf8p2
  elseif this_sigattrlog[2].matched then
    l_0_2 = this_sigattrlog[2].utf8p2
  elseif this_sigattrlog[3].matched then
    l_0_2 = this_sigattrlog[3].utf8p2
  elseif this_sigattrlog[4].matched then
    l_0_2 = this_sigattrlog[4].utf8p2
  end
  if this_sigattrlog[5].matched then
    l_0_2 = this_sigattrlog[5].utf8p2
  elseif this_sigattrlog[6].matched then
    l_0_2 = this_sigattrlog[6].utf8p2
  elseif this_sigattrlog[7].matched then
    l_0_2 = this_sigattrlog[7].utf8p2
  elseif this_sigattrlog[8].matched then
    l_0_2 = this_sigattrlog[8].utf8p2
  elseif this_sigattrlog[9].matched then
    l_0_2 = this_sigattrlog[9].utf8p2
  elseif this_sigattrlog[10].matched then
    l_0_2 = this_sigattrlog[10].utf8p2
  elseif this_sigattrlog[11].matched then
    l_0_2 = this_sigattrlog[11].utf8p2
  elseif this_sigattrlog[12].matched then
    l_0_2 = this_sigattrlog[12].utf8p2
  end
  
  function extract_script_file(l_1_0)
    local l_1_1 = "([%./%w%s_]+%.%w+)"
    local l_1_2 = l_1_0:match(l_1_1)
    if l_1_2 then
      l_1_2 = l_1_2:gsub("^(sudo%s+)", "")
      l_1_2 = l_1_2:gsub("^(%w+%s+)", "")
    end
    return l_1_2
  end
  
  if l_0_2 ~= nil and l_0_2 ~= "" then
    l_0_3 = extract_script_file(l_0_2)
  else
    return mp.CLEAN
  end
  
  function get_basename(l_2_0)
    local l_2_1 = l_2_0:reverse()
    local l_2_2 = l_2_1:match("([^/]+)")
    return l_2_2:reverse()
  end
  
  if l_0_3 ~= nil and l_0_3 ~= "" then
    if get_basename(l_0_0) ~= get_basename(l_0_3) then
      return mp.CLEAN
    end
  else
    return mp.CLEAN
  end
  bm.trigger_sig("TestExecutionFromScriptInSuspLocation", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
