-- Threat: !InfrastructureShared
-- Name: 2a78d6a21d0f
-- Type: 21

if not (peattributes.isdll and mp.get_mpattribute("BM_UnsignedDll")) or mp.getfilesize() > 1048576 then
  return mp.CLEAN
end
if peattributes.x86_image then
  if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
local l_0_0 = pe.get_exports_count()
if 3 < l_0_0 then
  return mp.CLEAN
end
return mp.INFECTED
