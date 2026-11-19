-- Threat: !InfrastructureShared
-- Name: 24785ba242e6
-- Type: 21

if not mp.get_mpattribute("pea_isdll") then
  return mp.CLEAN
end
local l_0_0 = pehdr.AddressOfEntryPoint + pehdr.ImageBase
if l_0_0 == hstrlog[1].VA then
  local l_0_1, l_0_2 = pe.get_exports()
  if 2 < l_0_1 then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
  mp.set_mpattribute("BorlandDelphiDllEntryPoint")
end
return mp.INFECTED
