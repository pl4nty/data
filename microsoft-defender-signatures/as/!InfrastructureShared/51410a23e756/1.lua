-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51410a23e756\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawRequestBlob)()
if l_0_0 == nil then
  return mp.CLEAN
end
if #l_0_0 < 28 then
  return mp.INFECTED
end
if l_0_0:sub(1, 4) ~= "\000\000\000\000" then
  return mp.INFECTED
end
return mp.CLEAN

