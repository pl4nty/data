-- Threat: !InfrastructureShared
-- Name: 1778ad532713
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 67108864 and mp.get_mpattribute("pea_isdll") and pehdr.Subsystem == 3 then
  local l_0_1 = pe.IMAGE_DIRECTORY_ENTRY_IMPORT
  if l_0_1 <= 4 and 1 <= l_0_1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
