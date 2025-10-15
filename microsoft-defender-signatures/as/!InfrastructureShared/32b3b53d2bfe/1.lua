-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3b53d2bfe\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil and l_0_0 ~= "" and l_0_0:lower() == "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" then
  return mp.INFECTED
end
return mp.CLEAN

