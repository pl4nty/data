-- Threat: !InfrastructureShared
-- Name: 2a89575ea7fb
-- Type: 21

if pe.isvdllbase(pe.get_regval(pe.REG_EBX)) == false then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 2, "d\000\000\000")
mp.set_mpattribute("FOPEX:Deep_Analysis_Disable_APILimit")
return mp.INFECTED
