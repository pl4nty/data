-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7bb9_269.luac 

-- params : ...
-- function num : 0
if (hstrlog[2]).matched then
  (mp.set_mpattribute)("HSTR:MoloteraeLinkChanger")
end
if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
return mp.CLEAN

