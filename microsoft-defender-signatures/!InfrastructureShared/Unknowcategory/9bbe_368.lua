-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9bbe_368.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.find)((pe.mmap_va)(pevars.sigaddr, 64), "s", 1, true) - 1
;
(pe.mmap_patch_va)(pevars.sigaddr + l_0_0, "\235")
;
(mp.set_mpattribute)("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED

