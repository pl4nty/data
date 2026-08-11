-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFComposerPackageInstall\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = {}
l_0_1["php.exe"] = true
l_0_1["composer.exe"] = true
if not l_0_1[l_0_0] then
  return mp.CLEAN
end
local l_0_2 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 ~= "installed.json" then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3:find("\\vendor\\composer\\", 1, true) == nil then
  return mp.CLEAN
end
return mp.INFECTED

