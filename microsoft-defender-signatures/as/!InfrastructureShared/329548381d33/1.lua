-- Threat: !InfrastructureShared
-- Name: 329548381d33
-- Type: 21

if peattributes.no_tls == true then
  return mp.CLEAN
end
pe.set_peattribute("hstr_exhaustive", true)
return mp.INFECTED
