-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\82ff_295.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and pehdr.SizeOfImage >= 217088 and pehdr.SizeOfImage <= 393216 then
  (mp.set_mpattribute)("Obf:Nivdort.S1")
  return mp.SUSPICIOUS
end
return mp.LOWFI

