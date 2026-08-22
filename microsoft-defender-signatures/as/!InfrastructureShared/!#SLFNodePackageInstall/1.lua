-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFNodePackageInstall\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 ~= "package.json" then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
local l_0_2 = {}
l_0_2["node.exe"] = true
l_0_2["npm.exe"] = true
l_0_2["pnpm.exe"] = true
l_0_2["yarn.exe"] = true
l_0_2["bun.exe"] = true
if not l_0_2[l_0_1] then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_3 == nil or l_0_3:find("\\node_modules\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = "NodePackageInstallSeen"
if IsKeyInRollingQueue(l_0_4, l_0_3, true) then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_4, l_0_3, "1", 28800, 50000, 1)
return mp.INFECTED

