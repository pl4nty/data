-- Threat: !InfrastructureShared
-- Name: 5157819d2b0af
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 == 1 then
  local l_0_2 = pe.mmap_string_rva(l_0_1[1].namerva, 64)
  if l_0_2 == "RegisterModule" then
    mp.set_mpattribute("BM_IISMODULE")
    return mp.INFECTED
  end
end
return mp.CLEAN
