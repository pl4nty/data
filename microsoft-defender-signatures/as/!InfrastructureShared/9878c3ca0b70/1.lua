-- Threat: !InfrastructureShared
-- Name: 9878c3ca0b70
-- Type: 21

if pehdr.Machine == 332 then
  if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
elseif not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN
