-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13db38c67b074\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 80000000 then
  return mp.CLEAN
end
if Has_NetworkLogonSuccess(true) then
  return mp.INFECTED
end
return mp.CLEAN

