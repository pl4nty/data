-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6c6a_235.luac 

-- params : ...
-- function num : 0
if (hstrlog[5]).matched then
  (mp.set_mpattribute)("Lowfi:Komodia:LSP:NoVuln")
  return mp.CLEAN
end
return mp.INFECTED

