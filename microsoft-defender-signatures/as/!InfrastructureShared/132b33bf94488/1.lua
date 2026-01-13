-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\132b33bf94488\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true
l_0_1["0d5a49d5-57c7-40c0-ab8b-3a066e83b05a"] = true
l_0_1["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true
if not l_0_1[(string.lower)(l_0_0)] then
  return mp.CLEAN
end
return mp.INFECTED

