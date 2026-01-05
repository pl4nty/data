-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15295b523534\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if IsPathExcludedXplatML(l_0_0) ~= true then
  return mp.INFECTED
end
return mp.CLEAN

