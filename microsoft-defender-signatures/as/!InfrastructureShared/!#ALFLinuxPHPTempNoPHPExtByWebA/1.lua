-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLinuxPHPTempNoPHPExtByWebA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilesize)()
if not l_0_1 or l_0_1 > 4096 then
  return mp.CLEAN
end
do
  if not l_0_0:match("^/tmp/") and not l_0_0:match("^/var/tmp/") then
    local l_0_2 = l_0_0:match("^/dev/shm/")
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  if l_0_0:find("/tmp/.zendsem.", 1, true) or l_0_0:find("/tmp/requestdir/", 1, true) or l_0_0:find("/tmp/composer", 1, true) or l_0_0:find("/tmp/phpstan/", 1, true) or l_0_0:find("/vendor/", 1, true) or l_0_0:find("/tests/", 1, true) then
    return mp.CLEAN
  end
  local l_0_3 = nil
  if not (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC108: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC113: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC118: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC120: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC122: Confused about usage of register: R3 in 'UnsetPending'

  -- DECOMPILER ERROR at PC124: Confused about usage of register: R3 in 'UnsetPending'

  if ((string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))):match("^php[0-9.]*$") or ((string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))):match("^php[-_]?fpm[0-9.]*$") or ((string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))):match("^php[-_]?cgi[0-9.]*$") or (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "httpd" or (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "apache" or (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "apache2" or (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "nginx" then
    return mp.INFECTED
  end
  return mp.CLEAN
end

