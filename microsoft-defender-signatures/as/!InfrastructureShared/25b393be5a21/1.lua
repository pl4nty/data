-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b393be5a21\1.luac 

-- params : ...
-- function num : 0
if IsInThirdPartySecurityPath() == true then
  return mp.CLEAN
end
return mp.INFECTED

