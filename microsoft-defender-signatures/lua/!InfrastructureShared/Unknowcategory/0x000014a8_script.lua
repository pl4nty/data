-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x000014a8_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  (mp.set_mpattribute)("MpNewlyCreatedHint")
end
return mp.CLEAN

