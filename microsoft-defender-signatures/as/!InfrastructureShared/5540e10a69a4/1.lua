-- Threat: !InfrastructureShared
-- Name: 5540e10a69a4
-- Type: 21

if peattributes.packed and peattributes.checks_teb_lasterror and peattributes.dynmem_APIcall and peattributes.executes_from_dynamic_memory then
  return mp.SUSPICIOUS
end
return mp.CLEAN
