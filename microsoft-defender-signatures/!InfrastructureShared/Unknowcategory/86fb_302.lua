-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\86fb_302.luac 

-- params : ...
-- function num : 0
(mp.set_mpattribute)("FOPEX:Deep_Analysis_VMM_Grow")
;
(pe.mmap_patch_va)(pevars.sigaddr - 2, "êê")
;
(pe.mmap_patch_va)(pevars.sigaddr + 7, "\001\000\000\000")
return mp.CLEAN

