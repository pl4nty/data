-- Threat: !InfrastructureShared
-- Name: 5278da463afd
-- Type: 21
-- Flags: 1

if peattributes.x86_image and mp.getfilesize() < 1048576 and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  return mp.INFECTED
end
return mp.CLEAN
