-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTriggerCloudForNWMSI\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_TRUSTCHECK then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(42)
if (crypto.bitand)(l_0_1, 2) == 2 then
  return mp.INFECTED
end
if (mp.IsTrustedFile)(false) == false then
  return mp.INFECTED
end
return mp.CLEAN

