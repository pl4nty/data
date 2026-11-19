-- Threat: !InfrastructureShared
-- Name: 8db3437b7b9c
-- Type: 21

local l_0_0 = 4294967295
local l_0_1
local l_0_2 = mp.CLEAN
if this_sigattrlog[2].matched then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p1)
  if l_0_1 ~= nil then
    l_0_0 = sysio.GetFileAttributes(l_0_1)
    if l_0_0 ~= 4294967295 and mp.bitand(l_0_0, 2) == 2 then
      bm.add_related_file(l_0_1)
      return mp.INFECTED
    end
  end
elseif this_sigattrlog[3].matched then
  l_0_1 = mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p1)
  if l_0_1 ~= nil then
    l_0_0 = sysio.GetFileAttributes(l_0_1)
    if l_0_0 ~= 4294967295 and mp.bitand(l_0_0, 2) == 2 then
      bm.add_related_file(l_0_1)
      return mp.INFECTED
    end
  end
elseif this_sigattrlog[1].matched then
  local l_0_3 = mp.GetExecutablesFromCommandLine(this_sigattrlog[1].utf8p2)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      l_0_0 = 4294967295
      l_0_0 = sysio.GetFileAttributes(l_0_5)
      if l_0_0 ~= 4294967295 and mp.bitand(l_0_0, 2) == 2 then
        bm.add_related_file(l_0_5)
        l_0_2 = mp.INFECTED
      end
    end
  end
end
if l_0_2 == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
