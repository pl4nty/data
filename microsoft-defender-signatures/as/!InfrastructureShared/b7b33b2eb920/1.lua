-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b33b2eb920\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_0, "psexesvc", 1, true) or (string.find)(l_0_0, "batchpatchexesvc", 1, true) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.IsHipsRuleEnabled)("d1e49aac-8f56-4280-b9ba-993a6d77406c")
if l_0_1 and l_0_2 == 1 then
  Has_NetworkLogonSuccess(true)
  return mp.INFECTED
end
return mp.CLEAN

