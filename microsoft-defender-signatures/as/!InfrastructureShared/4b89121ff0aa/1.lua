-- Threat: !InfrastructureShared
-- Name: 4b89121ff0aa
-- Type: 21

local l_0_0 = 256 - string.byte(pe.mmap_va(pevars.sigaddr + 2, 1))
pe.mmap_patch_va(pe.get_regval(pe.REG_EBP) - l_0_0, "\n\000\000\000")
pe.mmap_patch_va(pevars.sigaddr + 32, "\255T$\b\144\144")
pe.set_image_filename("notepad.exe")
pe.reemulate()
return mp.INFECTED
