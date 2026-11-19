-- Threat: !InfrastructureShared
-- Name: ac781f1b9dbb
-- Type: 21

if peattributes.ismsil == true and peattributes.nx_bit_set == true and peattributes.aslr_bit_set == true and peattributes.no_exception == true then
  return mp.INFECTED
end
return mp.CLEAN
