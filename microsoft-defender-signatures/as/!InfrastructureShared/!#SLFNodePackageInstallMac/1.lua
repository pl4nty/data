-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFNodePackageInstallMac\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = l_0_0:lower()
local l_0_1 = 0
local l_0_2 = l_0_0:find("/", 1, true)
while l_0_2 ~= nil do
  l_0_1 = l_0_2
  l_0_2 = l_0_0:find("/", l_0_1 + 1, true)
end
if l_0_1 > 0 then
  l_0_0 = l_0_0:sub(l_0_1 + 1)
end
local l_0_3 = {}
l_0_3.node = true
l_0_3.npm = true
l_0_3.npx = true
l_0_3.pnpm = true
l_0_3.yarn = true
l_0_3.bun = true
if not l_0_3[l_0_0] then
  return mp.CLEAN
end
if (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE)) == "package.json" then
  return mp.INFECTED
end
return mp.CLEAN

