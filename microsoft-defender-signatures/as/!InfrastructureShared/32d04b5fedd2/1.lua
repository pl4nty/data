-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32d04b5fedd2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if l_0_0 then
  l_0_0 = (string.lower)(l_0_0)
  if contains(l_0_0, "code\\user\\settings.json") then
    return mp.INFECTED
  end
end
return mp.CLEAN

