-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\72d7cb2f50d7\1.luac 

-- params : ...
-- function num : 0
if verify_non_prod_rings() then
  return mp.INFECTED
end
return mp.CLEAN

