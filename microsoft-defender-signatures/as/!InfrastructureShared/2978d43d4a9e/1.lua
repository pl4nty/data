-- Threat: !InfrastructureShared
-- Name: 2978d43d4a9e
-- Type: 21

if peattributes.isdll and mp.getfilesize() < 250000 then
  pe.set_peattribute("hstr_exhaustive", true)
  pe.reemulate()
end
return mp.INFECTED
