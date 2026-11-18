-- Threat: !InfrastructureShared
-- Name: e98c507a9da0
-- Type: 21

if elfhdr.type == 2 or elfhdr.type == 3 then
  return mp.INFECTED
end
if mp.get_mpattribute("Linux:HSTR:UPX_Packed") then
  return mp.INFECTED
end
return mp.CLEAN
