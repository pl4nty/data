-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPsLongVars\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 == nil or l_0_0 < 2000000 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetNormalizedScript)(true)
for l_0_5 in (string.gmatch)(l_0_1, "%$[a-zA-Z0-9_]+") do
  if #l_0_5 > 150 then
    return mp.INFECTED
  end
end
return mp.CLEAN

