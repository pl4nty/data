-- Threat: !InfrastructureShared
-- Name: 218978669389
-- Type: 21

if peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 17920 or 70656 < l_0_0 then
  return mp.CLEAN
end
pe.mmap_patch_va(pevars.sigaddr + 12, "\001\000\000")
return mp.INFECTED
