-- Threat: !InfrastructureShared
-- Name: 417841ab8d9d
-- Type: 21

if peattributes.isdll and peattributes.amd64_image and mp.getfilesize() < 371200 then
  pe.set_peattribute("hstr_exhaustive", true)
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
