-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\10bb3c0762701\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ExtractDeviceProperties()
if l_0_0 ~= nil and next(l_0_0) ~= nil then
  (bm.add_related_string)("ExtendedDeviceProperties", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

