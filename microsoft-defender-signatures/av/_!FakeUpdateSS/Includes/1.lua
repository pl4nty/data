-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!FakeUpdateSS\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil or l_0_0 == "" then
  if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) ~= true then
    return mp.CLEAN
  end
  if (mp.GetMOTWZone)() < 3 then
    return mp.CLEAN
  end
  l_0_0 = (mp.GetMOTWHostUrl)()
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if StringEndsWith(l_0_0, ".php") then
  return mp.INFECTED
end
return mp.CLEAN

