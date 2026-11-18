-- Threat: !InfrastructureShared
-- Name: 9c7809ec5328
-- Type: 21
-- Flags: 1

if peattributes.reads_vdll_code and peattributes.self_modifying_code then
  return mp.INFECTED
end
return mp.CLEAN
