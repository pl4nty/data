-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3dd74c01077b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 ~= nil then
  if StringStartsWith(l_0_1, "find") or StringStartsWith(l_0_1, "/bin/find") or StringStartsWith(l_0_1, "/usr/bin/find") then
    return mp.CLEAN
  end
  if StringStartsWith(l_0_1, "sha1sum") or StringStartsWith(l_0_1, "/bin/sha1sum") or StringStartsWith(l_0_1, "/usr/bin/sha1sum") then
    return mp.CLEAN
  end
end
return mp.INFECTED

