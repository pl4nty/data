-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\727812e38\0x0000989f_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("pea_enable_vmm_grow") then
  (pe.set_peattribute)("enable_vmm_grow", true)
  ;
  (pe.reemulate)()
else
  return mp.SUSPICIOUS
end
return mp.LOWFI

